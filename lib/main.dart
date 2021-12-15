import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:value_notifier_demo/mvvm_provider/route_config.dart';
import 'package:value_notifier_demo/mvvm_provider/utils/local_cache.dart';

import 'mvvm_provider/provider_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(RootApp(providers: providers,initialRoute: loginPage,routes: routes));
}

class RootApp extends StatefulWidget {
  final List<SingleChildWidget> providers;
  final List<GetPage> routes;
  final String initialRoute;

  const RootApp({Key? key,required this.providers,required this.initialRoute, required this.routes}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {

  @override
  void initState() {
      super.initState();
      LocalCache.getInstance().init();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: widget.providers,
        child: GetMaterialApp(
          initialRoute: widget.initialRoute,
          getPages: widget.routes,
          builder: EasyLoading.init(),
        ));
  }

}
