import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:value_notifier_demo/future_provider/user_biz.dart';
import 'package:value_notifier_demo/future_provider/user_model.dart';

void main() {
  runApp(const FutureProviderDemo());
}

class FutureProviderDemo extends StatelessWidget {
  const FutureProviderDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureProvider<UserModel2>(
        create: (_) => UserBiz().initName(),
        initialData: UserModel2('loading'),
        child: const MaterialApp(
          home: ShowName(),
        ));
  }
}

class ShowName extends StatelessWidget {
  const ShowName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Future Provider Demo")),
        body: Center(
          child: Column(
            children: [
              Consumer<UserModel2>(builder: (_, builder, child) {
                return Text("${builder.name}");
              }),
              ElevatedButton(
                  onPressed: () {
                    Provider.of<UserModel2>(context, listen: false)
                        .changeName("hi flutter");
                  },
                  child: const Text("Change Name")),
              Consumer<UserModel2>(builder: (_, builder, child) {
                return ElevatedButton(
                    onPressed: () {
                      builder.changeName("hi flutter2");
                    },
                    child: const Text("Change Name2"));
              }),
            ],
          ),
        ));
  }
}
