import 'package:dio/dio.dart';

class MyDio {
  late Dio _dio;

  MyDio() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://api.oioweb.cn/api/common', // 设置接口的基本URL
      connectTimeout: Duration(milliseconds: 5000), // 设置连接超时时间
      receiveTimeout: Duration(milliseconds: 3000), // 设置接收超时时间
    );

    _dio = Dio(options);

    // 添加请求拦截器
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // 可以在此处添加请求头、身份验证等逻辑
        return handler.next(options);
      },
    ));

    // 添加响应拦截器
    _dio.interceptors.add(InterceptorsWrapper(
      onResponse: (response, handler) {
        // 可以在此处对响应数据进行处理，如解析、转换等
        return handler.next(response);
      },
    ));

    // 添加错误处理拦截器
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (DioException error, handler) {
        // 可以在此处处理请求错误，如统一的错误提示、重试逻辑等
        return handler.next(error);
      },
    ));
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      Response response = await _dio.get(path,
          queryParameters: queryParameters, options: options);
      return response;
    } on DioException catch (error) {
      _handleError(error);
      rethrow;
    }
  }

  Future<Response> post(String path, dynamic data, {Options? options}) async {
    try {
      Response response = await _dio.post(path, data: data, options: options);
      return response;
    } on DioException catch (error) {
      _handleError(error);
      rethrow;
    }
  }

  void _handleError(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout) {
      // 处理连接超时错误
      print('连接超时');
    } else if (error.type == DioExceptionType.receiveTimeout) {
      // 处理接收超时错误
      print('接收超时');
    } else if (error.type == DioExceptionType.badResponse) {
      // 处理响应错误
      print('响应错误');
      print('状态码: ${error.response?.statusCode}');
      print('错误信息: ${error.response?.statusMessage}');
    } else if (error.type == DioExceptionType.cancel) {
      // 处理请求取消
      print('请求已取消');
    } else {
      // 处理其他错误
      print('请求发生错误');
    }
  }
}
