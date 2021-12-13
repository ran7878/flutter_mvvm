import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:value_notifier_demo/mvvm_provider/view/base_view_less.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/timer_view_model.dart';

class LoginCodeTimerView extends BaseViewLess<TimerViewModel>{
  const LoginCodeTimerView({Key? key}) : super(key: key);

  @override
  Widget builderView(BuildContext context, TimerViewModel model) {
    return Text(model.isGetCode?"${model.time}(s)":"获取验证码",style: const TextStyle(color: Colors.green));
  }

}