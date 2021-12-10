import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:value_notifier_demo/counter.dart';
import 'package:value_notifier_demo/mvvm_provider/view/login_view.dart';
import 'package:value_notifier_demo/provider_demo2.dart';

import 'mvvm_provider/provider_config.dart';

void main() {
  runApp(MultiProvider(
      providers: providers,
      child: const GetMaterialApp(
        home: LoginView(),
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final ValueNotifier<int> _countNotifier = ValueNotifier(0);
  late Timer _timer;
  void _incrementCounter() {
    /*setState(() {
      _counter++;
    });*/
    _countNotifier.value++;
  }

  void _incrementCounter2() {
    Counter _counter = context.read<Counter>();
    _counter.add();
  }

  @override
  void dispose() {
    super.dispose();
    //_timer.cancel();
  }
  @override
  void initState() {
    super.initState();
    /*_timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _incrementCounter();
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network("https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpicnew8.photophoto.cn%2F20131207%2Ffengjign03-29fengjingjianzhutianyuanzhiwushuijingtianyuanyinxianghuapaixieshizhuyiyouhuazhuangshihua-01501060_1.jpg&refer=http%3A%2F%2Fpicnew8.photophoto.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1640937632&t=f8bcce4f1bd26085c1a23993d09d704a"),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ValueListenableBuilder(valueListenable: _countNotifier, builder: (context,value,widget){
              return Text("$value");
            }),
            ElevatedButton(child: const Text("ValueNotifier",style: TextStyle(fontSize: 40)),onPressed: _incrementCounter),
            Consumer<Counter>(builder: (context,counter,child){
              return Text(
                'provider-->${counter.value}',
                style: Theme.of(context).textTheme.headline4,
              );
            }),
            ElevatedButton(child: const Text("Provider",style: TextStyle(fontSize: 40)),onPressed: _incrementCounter2),
            ElevatedButton(child: const Text("Go other page",style: TextStyle(fontSize: 40)),onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  //return const ReadDataFromProvider();
                  //return ProviderDemo1();
                  return ProviderDemo2();
                }));
            })

          ],
        ),
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
