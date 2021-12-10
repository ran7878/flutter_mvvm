import 'package:flutter/material.dart';
///ViewModel 中间层 ， 连接数据层和UI层
class BaseViewModel extends ChangeNotifier{
  bool disposed = false;

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