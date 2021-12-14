import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:value_notifier_demo/mvvm_provider/view/base_view_full.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/user_view_model.dart';

import '../route_config.dart';


class ForgetPwdView extends BaseViewFull<UserViewModel> {
  const ForgetPwdView({Key? key}) : super(key: key);

  @override
  Widget builderView(BuildContext context, UserViewModel model) {
    return Scaffold(
      appBar: AppBar(title: const Text("忘记密码")),
      body: Column(
        children: [
          const TextField(),
          ElevatedButton(
              onPressed: () {

              },
              child: const Text("提交")),
          ElevatedButton(
              onPressed: () {
                PageX.backTo(loginPage);
              },
              child: const Text("回退到登录页"))
        ],
      ),
    );
  }

  @override
  void onInit(BuildContext context) {
    dynamic map = PageX.getParams();
    print(jsonEncode(map));
  }
}
