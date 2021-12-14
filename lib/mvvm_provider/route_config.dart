
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:value_notifier_demo/mvvm_provider/view/child_view.dart';
import 'package:value_notifier_demo/mvvm_provider/view/forget_pwd_view.dart';
import 'package:value_notifier_demo/mvvm_provider/view/login_view.dart';

const loginPage = "/page/login";
const testPage = "/page/test";
const forgetPwdPage = "/page/forget_pwd";

final List<GetPage> routes = [
  GetPage(name: loginPage, page: ()=> const LoginView()),
  GetPage(name: testPage, page: ()=> const TestView()),
  GetPage(name: forgetPwdPage, page: ()=> const ForgetPwdView())
];

///路由跳转以及返回
class PageX{

  //页面跳转
  static Future<T?>? push<T>(String route,{dynamic args}){
    return Get.toNamed<T>(route,arguments: args);
  }
  //获取参数
  static dynamic getParams(){
    return Get.arguments;
  }

  //关闭当前页，然后跳转到route
  static Future<T?>? replace<T>(String route,{dynamic args}){
    return Get.offNamed<T>(route,arguments: args);
  }

  //返回上一个页面
  static void back<T>({dynamic args}){
    Get.back<T>(result: args);
  }

  //返回到指定路由
  static void backTo(String dest){
    Get.until(ModalRoute.withName(dest));
  }

  //回退到指定页dest，然后携带参数args跳转到route
  static Future<T?>? backAndPush<T>(String dest, String route, {dynamic args}) {
    return Get.offNamedUntil(route,ModalRoute.withName(dest),arguments: args);
  }
}
