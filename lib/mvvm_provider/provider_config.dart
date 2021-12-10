import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:value_notifier_demo/mvvm_provider/service/joke_service.dart';
import 'package:value_notifier_demo/mvvm_provider/service/user_service.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/joke_view_model.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/timer_view_model.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/user_view_model.dart';

List<SingleChildWidget> providers = [
  ...viewModelProviders,
  ...serviceProviders,
  ...proxyProviders
];

List<SingleChildWidget> viewModelProviders = [
  ChangeNotifierProvider(create: (_) => JokeViewModel()),
  ChangeNotifierProvider(create: (_) => UserViewModel()),
  ChangeNotifierProvider(create: (_) => TimerViewModel()),
];

List<SingleChildWidget> proxyProviders = [
  //这里使用ProxyProvider来定义需要依赖其他Provider的服务

];

List<SingleChildWidget> serviceProviders = [
  Provider(create: (_) => JokeService()),
  Provider(create: (_)=>UserService(getProvider<UserViewModel>(_),getProvider<TimerViewModel>(_)))
];

T getProvider<T>(BuildContext context){
  return Provider.of<T>(context,listen: false);
}