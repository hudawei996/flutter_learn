import 'package:flutter_learn/app/constants/index.dart';
import 'package:flutter_learn/app/utils/DioRequest.dart';
import 'package:flutter_learn/app/view_models/home_models.dart';

Future<GoodsDetailsItems> getGuessListAPI(Map<String, dynamic> params) async{
  final response = await dioRequest.get(HttpConstants.GUESS_LIST,params: params);
  return GoodsDetailsItems.fromJson(response);
}