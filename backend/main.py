# FastAPI主应用
from fastapi import FastAPI, HTTPException, Depends
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy.orm import Session
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from typing import List, Dict, Any, Optional
from pydantic import BaseModel

from config import DATABASE_URL, HOST, PORT
from models import Base, Banner, Category, Goods, SpecialRecommend, SubType, SubTypeGoods

# 创建数据库连接
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# 创建所有表
Base.metadata.create_all(bind=engine)

# 创建FastAPI应用
app = FastAPI(title="Meikou API", description="Meikou商城后端API", version="1.0.0")

# 配置CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # 在生产环境中应该限制为特定的前端域名
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# 依赖项：获取数据库会话
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# Pydantic模型定义
class BannerResponse(BaseModel):
    id: str
    imgUrl: str

    class Config:
        orm_mode = True

class GoodsResponse(BaseModel):
    id: str
    name: str
    desc: Optional[str]
    price: str
    picture: str
    orderNum: int
    payCount: Optional[int] = 0

    class Config:
        orm_mode = True

class CategoryResponse(BaseModel):
    id: str
    name: str
    picture: str
    children: Optional[List["CategoryResponse"]] = None
    goods: Optional[List[GoodsResponse]] = None

    class Config:
        orm_mode = True

class SubTypeResponse(BaseModel):
    id: str
    title: str
    goodsItems: Dict[str, Any]

    class Config:
        orm_mode = True

class SpecialRecommendResponse(BaseModel):
    id: str
    title: str
    subTypes: List[SubTypeResponse]

    class Config:
        orm_mode = True

class GoodsItemsResponse(BaseModel):
    counts: int
    pageSize: int
    pages: int
    page: int
    items: List[GoodsResponse]

    class Config:
        orm_mode = True

# 轮播图接口
@app.get("/home/banner", response_model=List[BannerResponse], tags=["首页"])
async def get_banner_list(db: Session = Depends(get_db)):
    banners = db.query(Banner).all()
    return [BannerResponse(id=b.id, imgUrl=b.img_url) for b in banners]

# 分类接口
@app.get("/home/category/head", response_model=List[CategoryResponse], tags=["首页"])
async def get_category_list(db: Session = Depends(get_db)):
    # 获取顶级分类
    categories = db.query(Category).filter(Category.parent_id == None).all()
    return categories

# 特惠推荐接口
@app.get("/hot/preference", response_model=SpecialRecommendResponse, tags=["推荐"])
async def get_preference_list(db: Session = Depends(get_db)):
    return get_special_recommend("preference", db)

# 爆款推荐接口
@app.get("/hot/inVogue", response_model=SpecialRecommendResponse, tags=["推荐"])
async def get_in_vogue_list(db: Session = Depends(get_db)):
    return get_special_recommend("in_vogue", db)

# 一站买全接口
@app.get("/hot/oneStop", response_model=SpecialRecommendResponse, tags=["推荐"])
async def get_one_stop_list(db: Session = Depends(get_db)):
    return get_special_recommend("one_stop", db)

# 获取特惠推荐/爆款推荐/一站买全数据的通用函数
def get_special_recommend(type_name: str, db: Session):
    special_recommend = db.query(SpecialRecommend).filter(SpecialRecommend.type == type_name).first()
    if not special_recommend:
        raise HTTPException(status_code=404, detail=f"{type_name}数据不存在")

    # 构建响应数据
    subtypes_response = []
    for subtype in special_recommend.subtypes:
        # 获取该子类型下的所有商品
        subtype_goods = db.query(SubTypeGoods).filter(SubTypeGoods.subtype_id == subtype.id).order_by(SubTypeGoods.order_num).all()
        items = [db.query(Goods).filter(Goods.id == sg.goods_id).first() for sg in subtype_goods]

        # 构建goodsItems
        goods_items = {
            "counts": len(items),
            "pageSize": len(items),
            "pages": 1,
            "page": 1,
            "items": items
        }

        subtypes_response.append(SubTypeResponse(id=subtype.id, title=subtype.title, goodsItems=goods_items))

    return SpecialRecommendResponse(id=special_recommend.id, title=special_recommend.title, subTypes=subtypes_response)

# 推荐列表接口
@app.get("/home/recommend", response_model=List[GoodsResponse], tags=["首页"])
async def get_recommend_list(limit: int = 10, db: Session = Depends(get_db)):
    goods = db.query(Goods).order_by(Goods.order_num).limit(limit).all()
    return goods

# 猜你喜欢接口
@app.get("/home/goods/guessLike", response_model=GoodsItemsResponse, tags=["首页"])
async def get_guess_like(page: int = 1, pageSize: int = 20, db: Session = Depends(get_db)):
    offset = (page - 1) * pageSize
    goods = db.query(Goods).order_by(Goods.pay_count.desc()).offset(offset).limit(pageSize).all()
    total = db.query(Goods).count()

    return GoodsItemsResponse(
        counts=total,
        pageSize=pageSize,
        pages=(total + pageSize - 1) // pageSize,
        page=page,
        items=goods
    )

# 启动应用
if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host=HOST, port=PORT)