import 'package:value_notifier_demo/mvvm_provider/view_model/base_view_model.dart';

class UserViewModel extends BaseViewModel{

  bool isError = false;

  void loginFailed(){
    isError = true;
    notifyListeners();
  }

  void loginSuccess(){
    isError = false;
    notifyListeners();
  }
}