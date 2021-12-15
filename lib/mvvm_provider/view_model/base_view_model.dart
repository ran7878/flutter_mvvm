import 'package:flutter/widgets.dart';

import '../provider_config.dart';

///ViewModel 中间层 ， 连接数据层和UI层
abstract class BaseViewModel<T> extends ChangeNotifier{
  final BuildContext context;
  T get service => _getService();
  bool disposed = false;

  BaseViewModel(this.context);

  T _getService(){
    return getProvider<T>(context);
  }

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