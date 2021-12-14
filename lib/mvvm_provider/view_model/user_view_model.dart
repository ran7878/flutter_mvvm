import 'package:flutter/widgets.dart';
import 'package:value_notifier_demo/mvvm_provider/provider_config.dart';
import 'package:value_notifier_demo/mvvm_provider/service/user_service.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/base_view_model.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/timer_view_model.dart';

class UserViewModel extends BaseViewModel{
//1、持有context ， 主动获取Service，用来进行数据层访问
//2、获取数据后通知UI做出改变notifyListeners
  bool isError = false;

  UserViewModel(BuildContext context) : super(context);

  Future<bool> login(String name,String pwd)async{
    bool ret = await getProvider<UserService>(context).login("15501393136", '111111');
    return ret;
  }

  void loginFailed(){
    isError = true;
    notifyListeners();
  }

  void loginSuccess(){
    isError = false;
    notifyListeners();
  }
}