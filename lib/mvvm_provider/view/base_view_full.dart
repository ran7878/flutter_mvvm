import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/base_view_model.dart';


abstract class BaseViewFull<T extends BaseViewModel> extends StatefulWidget{
  const BaseViewFull({Key? key}) : super(key: key);

  void onInit(BuildContext context);

  Widget builderView(BuildContext context, T model);

  Widget? child(){
    return null;
  }


  @override
  _BaseViewFullState<T> createState() => _BaseViewFullState<T>();
}
 class _BaseViewFullState<T extends BaseViewModel> extends State<BaseViewFull<T>>{

   @override
   void initState() {
    super.initState();
    widget.onInit(context);
   }

  @override
  Widget build(BuildContext context){
    return Consumer<T>(
      builder: (context, model,child)=>widget.builderView(context,model),
      child: widget.child(),
    );
  }

}



