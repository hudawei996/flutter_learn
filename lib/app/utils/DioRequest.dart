// 基于Dio的网络请求工具类
import 'package:dio/dio.dart';

import '../constants/index.dart';

class DioRequest {
  static final Dio _dio = Dio();
  // 构造函数
  DioRequest(){
    _dio.options
      ..baseUrl = GlobalConstants.BASE_URL
      ..sendTimeout = Duration(milliseconds: GlobalConstants.TIME_OUT)
      ..connectTimeout = Duration(milliseconds: GlobalConstants.TIME_OUT)
      ..receiveTimeout = Duration(milliseconds: GlobalConstants.TIME_OUT);

    //拦截器
    _addInterceptors();
  }

  // 添加拦截器
  void _addInterceptors(){
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (request, handler) {
        print("===== 打印网络请求URL =====  ${request.uri.toString()}");
        // 在发送请求之前做一些事情
        handler.next(request); // 继续发送请求
      },
      onResponse: (response, handler) {
        // 在收到响应之前做一些事情
        if(response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300){
          handler.next(response); // 继续处理响应
        } else {
          handler.reject(DioException(requestOptions: response.requestOptions)); // 继续处理响应
        }
      },
      onError: (DioException e, handler) {
        // 在发生错误之前做一些事情
        handler.reject(e); // 继续处理错误
      },
    ));
  }

  // 写了两层Future包裹，就会报错
  // Future<Future<dynamic>> get(String url,{Map<String,dynamic>? params}) async{
  Future<dynamic> get(String url,{Map<String,dynamic>? params}) async{
    return _handlerResponse(_dio.get(url,queryParameters: params));
  }

  Future<dynamic> _handlerResponse(Future<Response<dynamic>> task) async{
    try{
      Response<dynamic> response = await task;
      final data = response.data as Map<String,dynamic>;
      // 业务状态码 是 "1" ,不是数字 1
      if(data['code'] == GlobalConstants.SUCCESS_CODE){
        print("===== 加载数据成功🔔🔔 ${data["result"]}");
        return data["result"];
      }
      throw Exception(data['msg'] ?? "加载数据异常");
    }catch(e){
      throw Exception("catch 加载数据异常 $e");
    }
  }

}

// 单例对象
final dioRequest = DioRequest();

// dio请求工具发出请求 返回的数据 Response<dynamic>.data
// 把 Response<dynamic>.data 转换为 Map<String,dynamic>
// 把所有的接口的data解放出来
// 拿到真正的数据 要判断业务状态码是不是等于1
