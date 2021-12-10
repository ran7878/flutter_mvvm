import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:value_notifier_demo/mvvm_provider/view/login_view.dart';

import 'mvvm_provider/provider_config.dart';

void main() {
  runApp(MultiProvider(
      providers: providers,
      child: const GetMaterialApp(
        home: LoginView(),
      )));
}
