import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:value_notifier_demo/mvvm_provider/service/joke_service.dart';
import 'package:value_notifier_demo/mvvm_provider/view/base_view.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/joke_view_model.dart';

import '../provider_config.dart';
import 'base_view_full.dart';


class TestView extends BaseViewFull<JokeViewModel> {

  const TestView({Key? key}) : super(key: key);

  Widget buildView(JokeViewModel model) {
    return model.loading
        ? const Text("loading")
        : ListView.builder(shrinkWrap: true, itemBuilder: (_, index) {
            return Column(
              children: [
                Text("${model.jokeList![index].content}"),
                const Divider(
                  color: Colors.green,
                )
              ],
            );
          });
  }

  @override
  Widget builderView(BuildContext context, JokeViewModel model) {
    return Scaffold(
        appBar: AppBar(title: const Text("mvvm demo--test<T>")),
        body: buildView(model));
  }

  @override
  void onInit(BuildContext context) {
    getProvider<JokeService>(context).getJokeList(Provider.of<JokeViewModel>(context,listen: false));
  }

}

class JokeView extends StatelessWidget {
  const JokeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("mvvm demo")),

        ///消费者 ， 监听数据变化 刷新UI
        body: BaseView<JokeViewModel>(
            onInit: () {
              JokeService().getJokeList(Provider.of<JokeViewModel>(context,listen: false));
            },
            builder: (context, model, child) {
              return buildView(model);
            }));
  }

  Widget buildView(JokeViewModel model) {
    return model.loading
        ? const Text("loading")
        : ListView.builder(itemBuilder: (_, index) {
            return Column(
              children: [
                Text("${model.jokeList![index].content}"),
                const Divider(
                  color: Colors.green,
                )
              ],
            );
          });
  }
}
