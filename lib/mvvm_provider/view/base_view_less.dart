import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/base_view_model.dart';

abstract class BaseViewLess<T extends BaseViewModel> extends StatelessWidget{
  const BaseViewLess({Key? key}) : super(key: key);

  Widget builderView(BuildContext context, T model);

  Widget? child(){
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, model,child)=>builderView(context,model),
      child: child(),
    );
  }
}