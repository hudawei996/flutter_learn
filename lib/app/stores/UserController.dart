import 'package:get/get.dart';

import '../view_models/user.dart';

// 需要共享的对象 要有一些共享的属性 属性需要相应式更新
class UserController extends GetxController {
  // user对象被监听了 当userInfo改变时 会自动更新
  var user = UserInfo.fromJSON({}).obs;
  // 想要取值的话 需要使用 userInfo.value 来取值
  // 例如：userInfo.value.token 来获取token

  updateUserInfo(UserInfo newUserInfo) {
    user.value = newUserInfo;
  }
}
