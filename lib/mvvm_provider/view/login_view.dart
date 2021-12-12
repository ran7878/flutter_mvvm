import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:value_notifier_demo/mvvm_provider/provider_config.dart';
import 'package:value_notifier_demo/mvvm_provider/route_config.dart';
import 'package:value_notifier_demo/mvvm_provider/service/user_service.dart';
import 'package:value_notifier_demo/mvvm_provider/view/base_view_full.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/timer_view_model.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/user_view_model.dart';

import 'login_code_timer.dart';

class LoginView extends BaseViewFull<UserViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builderView(BuildContext context, UserViewModel model) {
    return Scaffold(
      appBar: AppBar(title: const Text("login")),
      body: Column(
        children: [
          const TextField(),
          Row(
            children: [
              const Expanded(child: TextField()),
              InkWell(
                  onTap: () {
                    getProvider<UserService>(context).getCode();
                  },
                  child: const LoginCodeTimerView())
            ],
          ),
          Visibility(visible: model.isError, child: const Text("用户名或密码错误",style: TextStyle(color: Colors.red))),
          ElevatedButton(
              onPressed: () async {
                bool ret = await model.login("name1", "pwd1");
                if (ret) {
                  //todo 此业务需要用到多个viewModel
                  // getProvider<TimerViewModel>(context).stopTime();

                  PageX.push(testPage,args: {"key":"没有val"});
                  //PageX.replaceTo(testPage,args: {"key":"没有val"});
                  //PageX.push(testPage);
                }
              },
              child: const Text("login"))
        ],
      ),
    );
  }

  @override
  void onInit(BuildContext context) {}
}
