import 'dart:convert';

import 'package:value_notifier_demo/mvvm_provider/model/joke_model.dart';
import 'package:value_notifier_demo/mvvm_provider/service/base_service.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/joke_view_model.dart';

class JokeService extends BaseService{
  ///请求接口获取数据，通过ViewModel通知view层做出改变
  Future<void> getJokeList(JokeViewModel jokeViewModel) async{
    var response = await dio.get("http://v.juhe.cn/joke/content/text.php?page=1&pagesize=20&key=03303e4d34effe095cf6a4257474cda9");
    if (response.statusCode == 200) {
      // 转换模型
      JokeModel jokeModel = jokeModelFromJson(json.encode(response.data["result"]));
      // 更新数据
      jokeViewModel.setJokeList(jokeModel);
    }
  }
}