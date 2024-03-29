import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:value_notifier_demo/mvvm_provider/service/user_service.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/timer_view_model.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/user_view_model.dart';

List<SingleChildWidget> providers = [
  ...serviceProviders,
  ...viewModelProviders,
  ...proxyProviders
];

List<SingleChildWidget> viewModelProviders = [
  ChangeNotifierProvider(create: (_) => UserViewModel(_)),
  ChangeNotifierProvider(create: (_) => TimerViewModel(_)),
];

List<SingleChildWidget> proxyProviders = [
  //这里使用ProxyProvider来定义需要依赖其他Provider的服务

];

List<SingleChildWidget> serviceProviders = [
  Provider(create: (_)=>UserService())
];

T getProvider<T>(BuildContext context){
  return Provider.of<T>(context,listen: false);
}