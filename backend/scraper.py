# 数据爬取脚本
import requests
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from config import ORIGINAL_BASE_URL, DATABASE_URL
from models import Base, Banner, Category, Goods, SpecialRecommend, SubType, SubTypeGoods

# 创建数据库连接
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# 创建所有表
Base.metadata.create_all(bind=engine)

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# 爬取轮播图数据
def scrape_banners():
    print("正在爬取轮播图数据...")
    url = f"{ORIGINAL_BASE_URL}/home/banner"
    response = requests.get(url)
    response.raise_for_status()
    data = response.json()

    db = next(get_db())
    try:
        # 清空现有数据
        db.query(Banner).delete()

        # 插入新数据
        for item in data:
            banner = Banner(id=item["id"], img_url=item["imgUrl"])
            db.add(banner)

        db.commit()
        print(f"成功爬取 {len(data)} 条轮播图数据")
    except Exception as e:
        db.rollback()
        print(f"爬取轮播图数据失败: {e}")
    finally:
        db.close()

# 爬取分类数据
def scrape_categories():
    print("正在爬取分类数据...")
    url = f"{ORIGINAL_BASE_URL}/home/category/head"
    response = requests.get(url)
    response.raise_for_status()
    data = response.json()

    db = next(get_db())
    try:
        # 清空现有数据
        db.query(Category).delete()

        # 递归插入分类数据
        def insert_category(category_data, parent_id=None):
            category = Category(
                id=category_data["id"],
                name=category_data["name"],
                picture=category_data["picture"],
                parent_id=parent_id
            )
            db.add(category)

            # 插入子分类
            if category_data.get("children"):
                for child in category_data["children"]:
                    insert_category(child, category.id)

        # 插入顶级分类
        for item in data:
            insert_category(item)

        db.commit()
        print(f"成功爬取 {len(data)} 条分类数据")
    except Exception as e:
        db.rollback()
        print(f"爬取分类数据失败: {e}")
    finally:
        db.close()

# 爬取特惠推荐/爆款推荐/一站买全数据
def scrape_special_recommend(type_name, url_path):
    print(f"正在爬取{type_name}数据...")
    url = f"{ORIGINAL_BASE_URL}{url_path}"
    response = requests.get(url)
    response.raise_for_status()
    data = response.json()

    db = next(get_db())
    try:
        # 清空对应类型的现有数据
        db.query(SpecialRecommend).filter(SpecialRecommend.type == type_name).delete()

        # 创建特惠推荐记录
        special_recommend = SpecialRecommend(
            id=data["id"],
            title=data["title"],
            type=type_name
        )
        db.add(special_recommend)

        # 插入子类型和商品
        for subtype_data in data["subTypes"]:
            subtype = SubType(
                id=subtype_data["id"],
                title=subtype_data["title"],
                special_recommend_id=data["id"]
            )
            db.add(subtype)

            # 插入商品
            for i, goods_data in enumerate(subtype_data["goodsItems"]["items"]):
                # 检查商品是否已存在
                goods = db.query(Goods).filter(Goods.id == goods_data["id"]).first()
                if not goods:
                    goods = Goods(
                        id=goods_data["id"],
                        name=goods_data["name"],
                        desc=goods_data.get("desc"),
                        price=goods_data["price"],
                        picture=goods_data["picture"],
                        order_num=goods_data["orderNum"]
                    )
                    db.add(goods)

                # 创建子类型商品关联
                subtype_goods = SubTypeGoods(
                    subtype_id=subtype_data["id"],
                    goods_id=goods_data["id"],
                    order_num=i
                )
                db.add(subtype_goods)

        db.commit()
        print(f"成功爬取{type_name}数据")
    except Exception as e:
        db.rollback()
        print(f"爬取{type_name}数据失败: {e}")
    finally:
        db.close()

# 爬取推荐列表数据
def scrape_recommend_list():
    print("正在爬取推荐列表数据...")
    url = f"{ORIGINAL_BASE_URL}/home/recommend?limit=10"
    response = requests.get(url)
    response.raise_for_status()
    data = response.json()

    db = next(get_db())
    try:
        # 插入或更新商品数据
        for goods_data in data:
            goods = db.query(Goods).filter(Goods.id == goods_data["id"]).first()
            if goods:
                # 更新现有商品
                goods.name = goods_data["name"]
                goods.price = goods_data["price"]
                goods.picture = goods_data["picture"]
                goods.order_num = goods_data["orderNum"]
                goods.pay_count = goods_data.get("payCount", 0)
            else:
                # 创建新商品
                goods = Goods(
                    id=goods_data["id"],
                    name=goods_data["name"],
                    price=goods_data["price"],
                    picture=goods_data["picture"],
                    order_num=goods_data["orderNum"],
                    pay_count=goods_data.get("payCount", 0)
                )
                db.add(goods)

        db.commit()
        print(f"成功爬取 {len(data)} 条推荐列表数据")
    except Exception as e:
        db.rollback()
        print(f"爬取推荐列表数据失败: {e}")
    finally:
        db.close()

# 爬取猜你喜欢数据
def scrape_guess_like():
    print("正在爬取猜你喜欢数据...")
    url = f"{ORIGINAL_BASE_URL}/home/goods/guessLike?page=1&pageSize=20"
    response = requests.get(url)
    response.raise_for_status()
    data = response.json()

    db = next(get_db())
    try:
        # 插入或更新商品数据
        for goods_data in data["items"]:
            goods = db.query(Goods).filter(Goods.id == goods_data["id"]).first()
            if goods:
                # 更新现有商品
                goods.name = goods_data["name"]
                goods.price = goods_data["price"]
                goods.picture = goods_data["picture"]
                goods.order_num = goods_data["orderNum"]
                goods.pay_count = goods_data.get("payCount", 0)
            else:
                # 创建新商品
                goods = Goods(
                    id=goods_data["id"],
                    name=goods_data["name"],
                    price=goods_data["price"],
                    picture=goods_data["picture"],
                    order_num=goods_data["orderNum"],
                    pay_count=goods_data.get("payCount", 0)
                )
                db.add(goods)

        db.commit()
        print(f"成功爬取 {len(data['items'])} 条猜你喜欢数据")
    except Exception as e:
        db.rollback()
        print(f"爬取猜你喜欢数据失败: {e}")
    finally:
        db.close()

# 爬取所有数据
def scrape_all():
    print("开始爬取所有数据...")

    # 创建所有表
    Base.metadata.create_all(bind=engine)

    # 爬取各接口数据
    scrape_banners()
    scrape_categories()
    scrape_special_recommend("preference", "/hot/preference")
    scrape_special_recommend("in_vogue", "/hot/inVogue")
    scrape_special_recommend("one_stop", "/hot/oneStop")
    scrape_recommend_list()
    scrape_guess_like()

    print("所有数据爬取完成！")

if __name__ == "__main__":
    scrape_all()