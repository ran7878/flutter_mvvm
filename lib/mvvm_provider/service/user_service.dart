import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:value_notifier_demo/mvvm_provider/service/base_service.dart';
import 'package:value_notifier_demo/mvvm_provider/service/http/base_bean.dart';
import 'package:value_notifier_demo/mvvm_provider/service/http/dio_constant.dart';


class UserService extends BaseService{

  Future<BaseBean?> login(String name,String captcha)async{
    Map<String,dynamic> map = {"phone":name,"captcha":captcha};
    return await post(loginUrl,map);//captcha
  }

  void getCode(){
    Future.delayed(const Duration(seconds: 1),(){
      //验证码发送成功
      debugPrint("验证码发送成功");
    });
  }


  Future<BaseBean?> getCommunityList(int pageNo,int pageSize)async{
    return await get(getCommunityUrl,{"pageNo":pageNo,"pageSize":pageSize});
  }
}