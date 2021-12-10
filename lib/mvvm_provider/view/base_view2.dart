import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/base_view_model.dart';


abstract class BaseView2<T extends BaseViewModel> extends StatefulWidget{
  const BaseView2({Key? key}) : super(key: key);

  void onInit(BuildContext context);

  Widget builder(BuildContext context, T model);

  Widget child();


  @override
  _BaseViewState2<T> createState() => _BaseViewState2<T>();
}
 class _BaseViewState2<T extends BaseViewModel> extends State<BaseView2<T>>{

   @override
   void initState() {
    super.initState();
    widget.onInit(context);
   }

  @override
  Widget build(BuildContext context){
    return Consumer<T>(
      builder: (context, model,child)=>widget.builder(context,model),
      child: widget.child(),
    );
  }

}



