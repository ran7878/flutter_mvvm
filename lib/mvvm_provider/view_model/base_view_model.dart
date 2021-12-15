import 'package:flutter/widgets.dart';

///ViewModel 中间层 ， 连接数据层和UI层
abstract class BaseViewModel extends ChangeNotifier{
  final BuildContext context;

  bool disposed = false;

  BaseViewModel(this.context);

  @override
  void dispose() {
    super.dispose();
    disposed = true;
  }

  @override
  void notifyListeners() {
    if (!disposed) {
      super.notifyListeners();
    }
  }
}