import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:value_notifier_demo/mvvm_provider/model/user_model.dart';
import 'package:value_notifier_demo/mvvm_provider/service/base_service.dart';
import 'package:value_notifier_demo/mvvm_provider/service/http/dio_constant.dart';

class UserService extends BaseService{
  UserService();

  Future<bool> login(String name,String captcha)async{
    var resp = await post(loginUrl,{"phone":name,"captcha":captcha});
    if(resp != null){
      UserModel userModel = UserModel.fromJson(resp);
      print(userModel.result!.access_token);
      return true;
    }else{
      return false;
    }
  }

  void getCode(){
    Future.delayed(const Duration(seconds: 1),(){
      //验证码发送成功
      debugPrint("验证码发送成功");
    });
    //开始倒计时
    //_timerViewModel.timeDowner();
  }

}