// 全局常量类
class GlobalConstants {
  static const String BASE_URL = "https://meikou-api.itheima.net";// 基础URL
  static const int TIME_OUT = 5000;// 超时时间
  static const String SUCCESS_CODE = "1";// 成功状态码

  static const String TOKEN_KEY = "hm_shop_token";
}


// 接口常量类
class HttpConstants {
  static const String BANNER_LIST = "/home/banner";// 轮播图接口
  static const String CATEGORY_LIST = "/home/category/head";// 分类接口
  static const String PREFERENCE_LIST = "/hot/preference";// 特惠推荐接口
  static const String IN_VOGUE_LIST = "/hot/inVogue";// 爆款推荐
  static const String ONE_STOP_LIST = "/hot/oneStop";// 一站买全
  static const String RECOMMEND_LIST = "/home/recommend"; // 推荐列表
  static const String GUESS_LIST = "/hot/goods/guessLike";// 猜你喜欢
  // 返回的结构体是，GoodsItems类型

  static const String LOGIN = "/login";// 登录接口
  static const String USER_PROFILE = "/member/profile";// 用户信息接口
}


// 1.请求地址有
// 2.请求类型是GoodsItems类型 =》 items => List<GoodsItems>
// 3.HmMoreList要的是 List<GoodDetailItem>类型