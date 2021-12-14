import 'package:flutter/widgets.dart';
import 'package:value_notifier_demo/mvvm_provider/model/community_model.dart';
import 'package:value_notifier_demo/mvvm_provider/model/user_model.dart';
import 'package:value_notifier_demo/mvvm_provider/provider_config.dart';
import 'package:value_notifier_demo/mvvm_provider/service/user_service.dart';
import 'package:value_notifier_demo/mvvm_provider/utils/local_cache.dart';
import 'package:value_notifier_demo/mvvm_provider/utils/log_util.dart';
import 'package:value_notifier_demo/mvvm_provider/view_model/base_view_model.dart';

class UserViewModel extends BaseViewModel{
//1、持有context ， 主动获取Service，用来进行数据层访问
//2、获取数据后通知UI做出改变notifyListeners
  bool isError = false;
  bool loading = true;
  List<CommunityModel>? communityModels;

  UserViewModel(BuildContext context) : super(context);

  Future<bool> login(String name,String pwd)async{
    UserModel? userModel = await getProvider<UserService>(context).login("15501393136", '111111');
    if(userModel != null){
      var token = userModel.result!.access_token;
      if(token!= null && token.isNotEmpty){
        LocalCache.getInstance().put("token", token);
        Log.i("UserService", "22---token = ${LocalCache.getInstance().get<String>("token")}");
        return true;
      }
    }
    return false;
  }

  Future<CommunityModel?> getCommunityList()async{
    communityModels = await getProvider<UserService>(context).getCommunityList(1,100);
    if(communityModels != null){
      loading = false;
      notifyListeners();
    }
  }
}