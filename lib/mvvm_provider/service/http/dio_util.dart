import 'package:dio/dio.dart';
import 'package:value_notifier_demo/mvvm_provider/service/http/dio_constant.dart';
import 'package:value_notifier_demo/mvvm_provider/utils/local_cache.dart';
import 'package:value_notifier_demo/mvvm_provider/utils/log_util.dart';
const dioUtilTag = "DioUtil";
class DioUtil{

  static late DioUtil _instance;
  static bool _isInstanceCreated = false;
  late Dio _dio;

  Dio get dio => _dio;

  factory DioUtil() => _getInstance();

  static DioUtil get instance => _getInstance();

  DioUtil._internal(){
    _dio = Dio()
    ..options = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 10000,
        receiveTimeout: 1000 * 60 * 60 * 24,
        responseType: ResponseType.json,
        headers: {"Content-Type": "application/json"})
    //网络状态拦截
    ..interceptors.add(AuthInterceptor())
    ..interceptors.add(HttpLog())
    ..interceptors.add(ErrorInterceptor());

  }
  static DioUtil _getInstance(){
    if(!_isInstanceCreated){
      _instance = DioUtil._internal();
      _isInstanceCreated = true;
    }
    return _instance;
  }
}

class AuthInterceptor extends Interceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String reqPath = options.path;
    if(reqPath != loginUrl){
      var token = LocalCache.getInstance().get<String>("token");
      Log.i(dioUtilTag, "token = $token");
      if(token!= null && token.isNotEmpty){
        options.headers['access-token'] = token;
      }
    }
    super.onRequest(options, handler);
  }
}

class HttpLog extends Interceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Log.i(dioUtilTag,"\n ---------Start Http Request---------");
    Log.i(dioUtilTag,"Request_BaseUrl:${options.baseUrl}");
    Log.i(dioUtilTag,"Request_Path:${options.path}");
    Log.i(dioUtilTag,"Request_Method:${options.method}");
    Log.i(dioUtilTag,"Request_Headers:${options.headers}");
    Log.i(dioUtilTag,"Request_Data:${options.data}");
    Log.i(dioUtilTag,"Request_QueryParameters:${options.queryParameters}");
    Log.i(dioUtilTag,"---------End Http Request---------");
    return super.onRequest(options,handler);
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Log.i(dioUtilTag,"---------Start Http Response---------");
    Log.i(dioUtilTag,"Response_BaseUrl:${response.requestOptions.baseUrl}");
    Log.i(dioUtilTag,"Response_Path:${response.requestOptions.path}");
    Log.i(dioUtilTag,"Response_StatusCode:${response.statusCode}");
    Log.i(dioUtilTag,"Response_StatusMessage:${response.statusMessage}");
    Log.i(dioUtilTag,"Response_Headers:${response.headers.toString()}");
    Log.i(dioUtilTag,"---------End Http Response---------");
    return super.onResponse(response,handler);
  }
}

class ErrorInterceptor extends Interceptor{

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Log.i(dioUtilTag,err);
    super.onError(err, handler);
  }
}