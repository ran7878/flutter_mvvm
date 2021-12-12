import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:value_notifier_demo/mvvm_provider/service/base_service.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/timer_view_model.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/user_view_model.dart';

class UserService extends BaseService{
  UserService();

  Future<bool> login(String name,String pwd)async{
    await Future.delayed(const Duration(seconds: 1));
    int minute = DateTime.now().minute;
    if(/*minute % 2 == 0*/true){
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