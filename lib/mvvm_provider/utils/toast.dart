import 'package:flutter_easyloading/flutter_easyloading.dart';

class Toast{
  Toast._();
  static late Toast _instance;
  static bool _isCreateInstance=false;

  static Toast getInstance(){
    if(!_isCreateInstance){
      _isCreateInstance = true;
      _instance = Toast._();
    }
    return _instance;
  }

  //   0: top,
  //   1: center
  //   2: bottom
  void show(String msg,{int position=2}){
      EasyLoading.showToast(msg,toastPosition: EasyLoadingToastPosition.values[position]);
  }
}