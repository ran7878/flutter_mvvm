import 'package:flutter/widgets.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/base_view_model.dart';

class TimerViewModel extends BaseViewModel{

  bool isGetCode = false;
  int time = 60;

  TimerViewModel(BuildContext context) : super(context);

  void timeDowner(){
    if(time > 0){
      isGetCode = true;
      time--;
      notifyListeners();
      Future.delayed(const Duration(seconds: 1),(){
        if(isGetCode){
          print("倒计时--$time");
          timeDowner();
        }
      });
    }else{
      stopTime();
    }
  }

  void stopTime(){
    isGetCode = false;
    time=60;
    notifyListeners();
  }

}