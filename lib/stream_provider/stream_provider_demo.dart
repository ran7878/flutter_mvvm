import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:value_notifier_demo/stream_provider/counter_stream.dart';
import 'package:value_notifier_demo/stream_provider/user_model.dart';

void main(){
  runApp(const StreamProviderDemo());
}

class StreamProviderDemo extends StatelessWidget{
  const StreamProviderDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return StreamProvider(create: (_)=>CounterStream().getStreamUserModel(), initialData: UserModel("start"),
    child: const MaterialApp(
      home: StreamPage()
    ));
  }

}

class StreamPage extends StatelessWidget{
  const StreamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Stream Provider")),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<UserModel>(
                builder: (_,b,c){
                  return Text("${b.name}");
                },
              ),
              Consumer<UserModel>(
                builder: (_,b,c){
                  return ElevatedButton(onPressed: (){
                    b.changeName("over");
                  }, child: const Text("改变值"));
                },
              )
            ],
          ),
        )
    );
  }

}