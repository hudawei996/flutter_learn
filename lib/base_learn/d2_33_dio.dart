import 'package:dio/dio.dart';

class DioUtils {
  final Dio _dio = Dio();

  DioUtils() {
    // 标准写法
    // _dio.options.baseUrl = "https://geek.itheima.net/v1_0";
    // _dio.options.connectTimeout = Duration(seconds: 10);//连接超时
    // _dio.options.sendTimeout = Duration(seconds: 10);//发送超时
    // _dio.options.receiveTimeout = Duration(seconds: 10);//接收超时

    //简写 .. 连续赋值的写法
    _dio.options
      ..baseUrl = "https://geek.itheima.net/v1_0/"
      ..connectTimeout = Duration(seconds: 10)
      ..sendTimeout = Duration(seconds: 10)
      ..receiveTimeout = Duration(seconds: 10);

    // 添加拦截器
    _addInterceptors();

    /// get 方法是在 DioUtils() 《构造函数内部定义的》，它是一个局部函数，其他类无法访问
    Future<Response<dynamic>> get(String url, {Map<String, dynamic>? params}) {
      return _dio.get(url, queryParameters: params);
    }
  }

  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (context, handler) {
          // handler.next(requestOptions)//放过请求
          // handler.reject(error);//拦截请求
          handler.next(context); //没有做任何处理
        },
        onResponse: (context, handler) {
          // http状态码 2xx成功 3xx 4xx 5xx
          if (context.statusCode! >= 200 && context.statusCode! < 300) {
            handler.next(context);
            return;
          } else {
            // 对于 404 等错误状态码，可以选择接受响应而不是拒绝
            handler.next(context);
          }
        },

        onError: (context, handler) {
          handler.reject(context); //直接排除异常
        },
      ),
    );
  }

  Future<Response<dynamic>> get(String url, {Map<String, dynamic>? params}) {
    return _dio.get(url, queryParameters: params);
  }
}
