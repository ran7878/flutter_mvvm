import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:value_notifier_demo/mvvm_provider/service/joke_service.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/joke_view_model.dart';

void main(){
  runApp(const IndexPage());
}
class IndexPage extends StatelessWidget{
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    /// ChangeNotifierProvider对JokeViewModel状态管理

    return ChangeNotifierProvider(create: (_)=>JokeViewModel(),
        child: const MaterialApp(
          home: JokeView(),
        ));
  }

}
class JokeView extends StatefulWidget{
  const JokeView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return JokeViewState();
  }

}
class JokeViewState extends State<JokeView>{

  @override
  void initState() {

    ///异步获取数据，传入ViewModel,做数据变化通知

   JokeService().getJokeList(Provider.of<JokeViewModel>(context,listen: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("mvvm demo")),
      ///消费者 ， 监听数据变化 刷新UI
      body: Consumer<JokeViewModel>(
        builder: (_,build,child){
          return build.loading?const Text("loading"):ListView.builder(itemBuilder: (_,index){
            return Column(
              children: [
                Text("${build.jokeList![index].content}")
                ,const Divider(color: Colors.red,)
              ],
            );
          }, itemCount: build.jokeList!.length);
        }
      ),
    );
  }

}