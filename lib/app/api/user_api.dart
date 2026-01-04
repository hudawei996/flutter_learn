import 'package:flutter_learn/app/view_models/user.dart';

import '../constants/index.dart';
import '../utils/DioRequest.dart';

Future<UserInfo> loginAPI(Map<String,dynamic> data) async{
  final response = await dioRequest.post(HttpConstants.login,data: data);
  return UserInfo.fromJSON(response);
}
