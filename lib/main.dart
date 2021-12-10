import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:value_notifier_demo/mvvm_provider/route_config.dart';

import 'mvvm_provider/provider_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
      super.initState();
      //todo init something
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers,
        child: GetMaterialApp(
          initialRoute: loginPage,
          getPages: routes,
        ));
  }

}
