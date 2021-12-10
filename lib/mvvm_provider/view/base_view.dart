import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/base_view_model.dart';


class BaseView<T extends BaseViewModel> extends StatefulWidget{
  const BaseView({Key? key, required this.onInit,required this.builder,this.child}) : super(key: key);

  final Widget? child;

  final Function() onInit;


  final Widget Function(BuildContext context, T model, Widget? child) builder;

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();

}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  @override
  void initState() {
    super.initState();
    widget.onInit();
  }

  @override
  Widget build(BuildContext context){
    return Consumer<T>(
      builder: widget.builder,
      child: widget.child,
    );
  }
}

