# 数据库模型
from sqlalchemy import Column, Integer, String, Float, ForeignKey, Text
from sqlalchemy.orm import relationship, declarative_base

Base = declarative_base()

# 轮播图模型
class Banner(Base):
    __tablename__ = "banners"

    id = Column(String, primary_key=True, index=True)
    img_url = Column(String, nullable=False)

# 分类模型
class Category(Base):
    __tablename__ = "categories"

    id = Column(String, primary_key=True, index=True)
    name = Column(String, nullable=False)
    picture = Column(String, nullable=False)

    # 子分类关系
    parent_id = Column(String, ForeignKey("categories.id"), nullable=True)
    children = relationship("Category", backref="parent", remote_side=[id])

    # 商品关系
    goods = relationship("Goods", back_populates="category", cascade="all, delete-orphan")

# 商品模型
class Goods(Base):
    __tablename__ = "goods"

    id = Column(String, primary_key=True, index=True)
    name = Column(String, nullable=False)
    desc = Column(Text, nullable=True)
    price = Column(String, nullable=False, default="0.00")
    picture = Column(String, nullable=False)
    order_num = Column(Integer, nullable=False, default=0)
    pay_count = Column(Integer, nullable=False, default=0)

    # 分类关系
    category_id = Column(String, ForeignKey("categories.id"), nullable=True)
    category = relationship("Category", back_populates="goods")

# 特惠推荐/爆款推荐/一站买全模型
class SpecialRecommend(Base):
    __tablename__ = "special_recommends"

    id = Column(String, primary_key=True, index=True)
    title = Column(String, nullable=False)
    type = Column(String, nullable=False)  # preference, in_vogue, one_stop

    # 子类型关系
    subtypes = relationship("SubType", back_populates="special_recommend", cascade="all, delete-orphan")

# 推荐子类型模型
class SubType(Base):
    __tablename__ = "sub_types"

    id = Column(String, primary_key=True, index=True)
    title = Column(String, nullable=False)

    # 关联的特惠推荐
    special_recommend_id = Column(String, ForeignKey("special_recommends.id"), nullable=False)
    special_recommend = relationship("SpecialRecommend", back_populates="subtypes")

    # 商品关系
    goods = relationship("SubTypeGoods", back_populates="subtype", cascade="all, delete-orphan")

# 子类型商品关系表
class SubTypeGoods(Base):
    __tablename__ = "sub_type_goods"

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    subtype_id = Column(String, ForeignKey("sub_types.id"), nullable=False)
    goods_id = Column(String, ForeignKey("goods.id"), nullable=False)
    order_num = Column(Integer, nullable=False, default=0)

    # 关系
    subtype = relationship("SubType", back_populates="goods")
    goods = relationship("Goods")