import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(const Index());
}
///
///ChangeNotifierProvider使用
///
class Index extends StatelessWidget {
  const Index({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => PageControllerProvider())
    ],child: MaterialApp(
      home: ProviderDemo2(),
    ));
  }

}

class ProviderDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageControllerProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Scaffold(
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.eleven_mp),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return const OtherPage(title: "操作上个界面的index");
                }));
              },
            ),
            body: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller:
                  Provider.of<PageControllerProvider>(context, listen: false)
                      .pageController,
              children: const [
                ContentPage(title: "page 1"),
                ContentPage(title: "page 2"),
                ContentPage(title: "page 3")
              ],
            ));
      },
    );
  }
}

class ContentPage extends StatelessWidget {
  final String title;

  const ContentPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(title));
  }
}

class OtherPage extends StatelessWidget {
  final String title;

  const OtherPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PageControllerProvider>(
      builder:(_,builder,child){ return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Column(
          children: [
            ElevatedButton(
                child: Text("select 0"),
                onPressed: () {
                /*  Provider.of<PageControllerProvider>(context, listen: false)
                      .setPageIndex(0);*/
                  builder.setPageIndex(0);
                }),
            ElevatedButton(
                child: Text("select 1"),
                onPressed: () {
                  Provider.of<PageControllerProvider>(context, listen: false)
                      .setPageIndex(1);
                }),
            ElevatedButton(
                child: Text("select 2"),
                onPressed: () {
                  Provider.of<PageControllerProvider>(context, listen: false)
                      .setPageIndex(2);
                })
          ],
        ),
      );}
    );
  }
}

class PageControllerProvider extends ChangeNotifier {
  PageController pageController = PageController();

  setPageIndex(int i) {
    pageController.jumpToPage(i);
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
