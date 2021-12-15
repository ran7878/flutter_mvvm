import 'package:flutter/widgets.dart';
import 'package:value_notifier_demo/mvvm_provider/model/community_model.dart';
import 'package:value_notifier_demo/mvvm_provider/model/user_model.dart';
import 'package:value_notifier_demo/mvvm_provider/provider_config.dart';
import 'package:value_notifier_demo/mvvm_provider/service/http/base_bean.dart';
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
  String? msg;

  UserViewModel(BuildContext context) : super(context);

  Future<bool> login(String name, String pwd) async {
    BaseBean? resp = await getProvider<UserService>(context).login("15501393136", '111111');
    if (resp != null) {
      if (resp.code == 200) {
        UserModel userModel = UserModel.fromJson(resp.result);
        var token = userModel.access_token;
        if (token != null && token.isNotEmpty) {
          LocalCache.getInstance().put("token", token);
          return true;
        }
      } else {
        Log.e("tag", "code = ${resp.code} , msg = ${resp.message}");
        //通知viewModel
        isError = true;
        notifyListeners();
      }
    }
    return false;
  }

  Future getCommunityList()async{
    BaseBean? resp = await getProvider<UserService>(context).getCommunityList(1,100);
    if(resp != null){
      if(resp.code == 200){
        List<Map<String, dynamic>> jsonList = List<Map<String, dynamic>>.from(resp.result['records']);
        communityModels = jsonList.map((m) => CommunityModel.fromJson(m)).toList();
        if(communityModels != null){
          loading = false;
          notifyListeners();
        }
      }else{
        Log.e("tag", "code = ${resp.code} , msg = ${resp.message}");
        msg = resp.message;
        notifyListeners();
      }
    }
  }
}