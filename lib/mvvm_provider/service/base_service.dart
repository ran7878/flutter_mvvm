import 'package:dio/dio.dart';
import 'package:value_notifier_demo/mvvm_provider/service/http/dio_util.dart';
import 'package:value_notifier_demo/mvvm_provider/utils/log_util.dart';


class BaseService{
  final Dio _dio = DioUtil.instance.dio;
  final tag = "BaseService";
  Future<dynamic> get(String path, Map<String, dynamic> params,
      {Map<String, String>? header})async{
    try{
      var options = Options(headers: header);
      Response resp = await _dio.get(path,queryParameters: params,options: options);
      if(resp.statusCode == 200){
        return resp.data;
      }else{
        throw Exception("http error ${resp.statusCode}, msg:${resp.statusMessage}");
      }
    }on DioError catch (e){
      //org.apache.shiro.authc.AuthenticationException
      Log.e(tag, e.response!.data['exception']);
    }
  }

  Future<dynamic> post(String path, Map<String, dynamic> params,
      {Map<String, String>? header}) async {
    try{
      var options = Options(headers: header);
      Response resp = await _dio.post(path, data: params, options: options);
      if(resp.statusCode == 200){
        return resp.data;
      }else{
        throw Exception("http error ${resp.statusCode}, msg:${resp.statusMessage}");
      }
    }on DioError catch (e){
      //org.apache.shiro.authc.AuthenticationException
      Log.e(tag, e.response!.data['exception']);
    }
  }
}