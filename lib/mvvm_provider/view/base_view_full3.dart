import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/base_view_model.dart';


abstract class BaseViewFull3<A extends BaseViewModel,B extends BaseViewModel,C extends BaseViewModel> extends StatefulWidget{
  const BaseViewFull3({Key? key}) : super(key: key);

  void onInit(BuildContext context);

  Widget builderView(BuildContext context, A modelA,B modelB,C modelC);

  Widget? child(){
    return null;
  }


  @override
  _BaseViewFullState3<A,B,C> createState() => _BaseViewFullState3<A,B,C>();
}
 class _BaseViewFullState3<A extends BaseViewModel,B extends BaseViewModel,C extends BaseViewModel> extends State<BaseViewFull3<A,B,C>>{

   @override
   void initState() {
    super.initState();
    widget.onInit(context);
   }

  @override
  Widget build(BuildContext context){
    return Consumer3<A,B,C>(
      builder: (context, modelA,modelB,modelC,child)=>widget.builderView(context,modelA,modelB,modelC),
      child: widget.child(),
    );
  }

}



