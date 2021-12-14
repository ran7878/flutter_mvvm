import 'package:value_notifier_demo/future_provider/user_model.dart';

class UserBiz{


  //返回一个Future
  Future<UserModel2> initName() async{
    await Future.delayed(const Duration(seconds: 2));
    String name = 'first get name';
    return UserModel2(name);
  }


}