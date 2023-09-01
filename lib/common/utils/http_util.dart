import 'package:dio/dio.dart';
import 'package:ulearning_app/common/values/constant.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  late Dio dio;

  factory HttpUtil() {
    return _instance;
  }

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL,
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
      headers: {},
      contentType: "application/json: charset=utf-8",
      responseType: ResponseType.json,
    );
    dio = Dio(options);
  }

  Future post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    print("response is ${response.toString()}");
    return response.data;
  }
}
