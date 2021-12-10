
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:value_notifier_demo/mvvm_provider/provider_config.dart';
import 'package:value_notifier_demo/mvvm_provider/service/user_service.dart';
import 'package:value_notifier_demo/mvvm_provider/view/base_view2.dart';
import 'package:value_notifier_demo/mvvm_provider/view/child_view.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/user_view_model.dart';

class LoginView extends BaseView2<UserViewModel>{
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, UserViewModel model) {
     return Scaffold(
       appBar: AppBar(title: const Text("login")),
       body: Column(
         children: [
           const TextField(),
           Row(children: [
             const Expanded(child: TextField()),
             InkWell(onTap:(){
              getProvider<UserService>(context).getCode();
             },child: Text(model.isGetCode?"${model.time}(s)":"获取验证码"))
           ],),
           ElevatedButton(onPressed: ()async{
             bool ret = await getProvider<UserService>(context).login("name1", "pwd1");
             if(ret){
                Get.to(()=>const TestView());
             }
           },child: const Text("login"))
         ],
       ),
     );
  }

  @override
  Widget child() {
    return const SizedBox();
  }

  @override
  void onInit(BuildContext context) {
  }

}