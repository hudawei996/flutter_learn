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

// 爆款推荐
Future<SpecialRecommendResult> getInVogueList() async {
  return SpecialRecommendResult.fromJson(
    await dioRequest.get(HttpConstants.IN_VOGUE_LIST),
  );
}

// 一站买全
Future<SpecialRecommendResult> getOneStopList() async {
  return SpecialRecommendResult.fromJson(
    await dioRequest.get(HttpConstants.ONE_STOP_LIST),
  );
}

// 推荐列表
Future<List<GoodDetailItem>> getRecommendListAPI(
  Map<String, dynamic> params,
) async {
  // 返回请求
  return ((await dioRequest.get(HttpConstants.RECOMMEND_LIST, params: params))
          as List)
      .map((item) {
        return GoodDetailItem.formJSON(item as Map<String, dynamic>);
      })
      .toList();
}
