import 'package:value_notifier_demo/mvvm_provider/service/base_service.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/user_view_model.dart';

class UserService extends BaseService{
  final UserViewModel _userViewModel;
  UserService(this._userViewModel);
  Future<bool> login(String name,String pwd)async{
    Future.delayed(const Duration(seconds: 1));
    _userViewModel.stopTime();
    return true;
  }

  void getCode(){
    Future.delayed(const Duration(seconds: 1));
    //开始倒计时
    _userViewModel.timeDowner();
  }

}