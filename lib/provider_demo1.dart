import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:value_notifier_demo/counter.dart';

class ProviderDemo1 extends StatelessWidget{
  final ValueNotifier<int> _notifier = ValueNotifier(1);

  ProviderDemo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("provider demo1"),
      ),
      body: ValueListenableProvider.value(
        value:_notifier,
        child:Column(
          children:  [
            const View1(),const View2()/*,const View3()*/,ElevatedButton(onPressed: (){
              _notifier.value++;
            }, child: const Text("add"))
          ],
        ),
      ),
    );
  }

}

class View1 extends StatelessWidget{
  const View1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<int>(builder: (_,value,child){
      return Text("1--->val = $value");
    });
  }

}

class View2 extends StatelessWidget{
  const View2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("2--->val = ${Provider.of<int>(context,listen: false)}");
  }

}

class View3 extends StatelessWidget{
  const View3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("333-->val = ${Provider.of(context)}");
  }

}