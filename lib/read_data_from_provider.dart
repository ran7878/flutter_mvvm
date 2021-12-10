import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:value_notifier_demo/counter.dart';

class ReadDataFromProvider extends StatelessWidget{
  const ReadDataFromProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<Counter>(builder: (context,_counter,_child){
              return Text("get data from provider --> ${_counter.value}");
            },
            ),
            ElevatedButton(onPressed: (){
              Provider.of<Counter>(context,listen: false).reset();
            }, child: const Text("clear count"))
          ],
        )
      )
    );
  }
}