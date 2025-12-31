// 每一个轮播图的具体类型
class BannerItem {
  String id;
  String imgUrl;

  BannerItem({required this.id, required this.imgUrl});

  // 扩展一个工厂函数 一般用factory来声明 一般用来创建实例对象
  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(id: json['id'] ?? "", imgUrl: json['imgUrl'] ?? "");
  }
}

// Map<String, dynamic>
// 每一个轮播图具体类型

// flutter 必须强制转化 没有隐式转化

// 根据以上json编写class对象和工厂转化函数
// 商品模型类
class GoodsItem {
  String id;
  String name;
  String? desc;
  String price;
  String picture;
  int orderNum;

  GoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });

  factory GoodsItem.fromJson(Map<String, dynamic> json) {
    return GoodsItem(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      desc: json['desc'],
      price: json['price'] ?? "0.00",
      picture: json['picture'] ?? "",
      orderNum: json['orderNum'] ?? 0,
    );
  }
}

// 分类模型类
class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;
  List<GoodsItem>? goods;

  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
    this.goods,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      picture: json['picture'] ?? "",
      children: json["children"] == null
          ? null
          : (json['children'] as List<dynamic>?)
                ?.map(
                  (child) =>
                      CategoryItem.fromJson(child as Map<String, dynamic>),
                )
                .toList(),
      goods: json['goods'] == null
          ? null
          : (json['goods'] as List<dynamic>?)
                ?.map(
                  (good) => GoodsItem.fromJson(good as Map<String, dynamic>),
                )
                .toList(),
    );
  }
}


// 特惠推荐结果模型
class SpecialRecommendResult {
  String id;
  String title;
  List<SubType> subTypes;

  SpecialRecommendResult({
    required this.id,
    required this.title,
    required this.subTypes,
  });

  factory SpecialRecommendResult.fromJson(Map<String, dynamic> json) {
    return SpecialRecommendResult(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
      subTypes: (json['subTypes'] as List<dynamic>?)
          ?.map((item) => SubType.fromJson(item as Map<String, dynamic>))
          .toList() ??
          [],
    );
  }
}

// 特惠推荐子类型模型
class SubType {
  String id;
  String title;
  GoodsItems goodsItems;

  SubType({
    required this.id,
    required this.title,
    required this.goodsItems,
  });

  factory SubType.fromJson(Map<String, dynamic> json) {
    return SubType(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
      goodsItems: GoodsItems.fromJson(json['goodsItems'] as Map<String, dynamic>),
    );
  }
}

// 商品列表模型
class GoodsItems {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<GoodsItem> items;

  GoodsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });

  factory GoodsItems.fromJson(Map<String, dynamic> json) {
    return GoodsItems(
      counts: json['counts'] ?? 0,
      pageSize: json['pageSize'] ?? 0,
      pages: json['pages'] ?? 0,
      page: json['page'] ?? 0,
      items: (json['items'] as List<dynamic>?)
          ?.map((item) => GoodsItem.fromJson(item as Map<String, dynamic>))
          .toList() ??
          [],
    );
  }
}


// 爆款推荐 类型
// 根据 爆款推荐.json文件生成对应的类型和工厂转化函数
// 可以复用 特惠推荐结果类型 SpecialRecommendResult



// 列表项类型
class GoodDetailItem extends GoodsItem {
  int payCount = 0;

  /// 商品详情项
  GoodDetailItem({
    required super.id,
    required super.name,
    required super.price,
    required super.picture,
    required super.orderNum,
    required this.payCount,
  }) : super(desc: "");
  // 转化方法
  factory GoodDetailItem.formJSON(Map<String, dynamic> json) {
    return GoodDetailItem(
      id: json["id"]?.toString() ?? "",
      name: json["name"]?.toString() ?? "",
      price: json["price"]?.toString() ?? "",
      picture: json["picture"]?.toString() ?? "",
      orderNum: int.tryParse(json["orderNum"]?.toString() ?? "0") ?? 0,
      payCount: int.tryParse(json["payCount"]?.toString() ?? "0") ?? 0,
    );
  }
}