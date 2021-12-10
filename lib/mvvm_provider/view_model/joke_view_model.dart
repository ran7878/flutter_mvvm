import 'package:flutter/material.dart';
import 'package:value_notifier_demo/mvvm_provider/model/joke_model.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/base_view_model.dart';
///ViewModel 中间层 ， 连接数据层和UI层
class JokeViewModel extends BaseViewModel{

  List<Joke>? _list = [];

  bool loading = true;

  void setJokeList(JokeModel jokeModel){
    _list = [];
    _list = jokeModel.data;
    loading = false;
    notifyListeners();
  }

  List<Joke>? get jokeList => _list;
}