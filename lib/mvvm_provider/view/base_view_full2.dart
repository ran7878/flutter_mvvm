import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/base_view_model.dart';


abstract class BaseViewFull2<A extends BaseViewModel,B extends BaseViewModel> extends StatefulWidget{
  const BaseViewFull2({Key? key}) : super(key: key);

  void onInit(BuildContext context);

  Widget builderView(BuildContext context, A modelA,B modelB);

  Widget? child(){
    return null;
  }


  @override
  _BaseViewFullState2<A,B> createState() => _BaseViewFullState2<A,B>();
}
 class _BaseViewFullState2<A extends BaseViewModel,B extends BaseViewModel> extends State<BaseViewFull2<A,B>>{

   @override
   void initState() {
    super.initState();
    widget.onInit(context);
   }

  @override
  Widget build(BuildContext context){
    return Consumer2<A,B>(
      builder: (context, modelA,modelB,child)=>widget.builderView(context,modelA,modelB),
      child: widget.child(),
    );
  }

}



