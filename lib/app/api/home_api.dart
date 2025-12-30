// 封装一个api 用来请求轮播图数据
// 轮播图数据模型
import 'package:flutter_learn/app/constants/index.dart';

import '../utils/DioRequest.dart';
import '../view_models/home_models.dart';

Future<List<BannerItem>> getBannerList() async {
  return ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((
    item,
  ) {
    return BannerItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}

Future<List<CategoryItem>> getCategoryList() async {
  return ((await dioRequest.get(HttpConstants.CATEGORY_LIST)) as List).map((
      item,
      ) {
    return CategoryItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}

// 特惠推荐数据模型
Future<SpecialRecommendResult> getPreferenceList() async {
  return SpecialRecommendResult.fromJson(
    await dioRequest.get(HttpConstants.PREFERENCE_LIST),
  );
}
