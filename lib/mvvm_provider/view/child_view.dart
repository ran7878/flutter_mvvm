import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/user_view_model.dart';

import '../provider_config.dart';
import '../route_config.dart';
import 'base_view_full.dart';

class TestView extends BaseViewFull<UserViewModel> {
  const TestView({Key? key}) : super(key: key);

  Widget buildView(UserViewModel model) {
    return model.loading
        ? const Text("loading")
        : (model.msg == null
            ? Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        PageX.backAndPush(loginPage, forgetPwdPage,
                            args: {"test": "22222"});
                      },
                      child: const Text("从登录页跳到忘记密码页")),
                  ElevatedButton(
                      onPressed: () {
                        //PageX.backAndPush(loginPage,forgetPwdPage,args: {"test":"22222"});
                        PageX.push(forgetPwdPage,
                            args: {"forgetPwdPage": "forgetPwdPage args"});
                      },
                      child: const Text("跳到忘记密码页")),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: model.communityModels!.length,
                        itemBuilder: (_, index) {
                          return Column(
                            children: [
                              Text(
                                  "${model.communityModels![index].communityNm}"),
                              const Divider(
                                color: Colors.green,
                              )
                            ],
                          );
                        }),
                  )
                ],
              )
            : Text("${model.msg}"));
  }

  @override
  Widget builderView(BuildContext context, UserViewModel model) {
    return Scaffold(
        appBar: AppBar(title: const Text("mvvm demo")),
        body: buildView(model));
  }

  @override
  void onInit(BuildContext context) {
    dynamic map = PageX.getParams();
    print(jsonEncode(map));
    getProvider<UserViewModel>(context).getCommunityList();
  }
}
