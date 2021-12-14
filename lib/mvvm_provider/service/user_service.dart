import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:value_notifier_demo/mvvm_provider/model/community_model.dart';
import 'package:value_notifier_demo/mvvm_provider/model/user_model.dart';
import 'package:value_notifier_demo/mvvm_provider/service/base_service.dart';
import 'package:value_notifier_demo/mvvm_provider/service/http/dio_constant.dart';
import 'package:value_notifier_demo/mvvm_provider/utils/log_util.dart';


class UserService extends BaseService{
  UserService();

  Future<UserModel?> login(String name,String captcha)async{
    var resp = await post(loginUrl,{"phone":name,"captcha":captcha});
    if(resp != null){
      UserModel userModel = UserModel.fromJson(resp);
      Log.i("UserService", "11---token = ${userModel.result!.access_token}");
      return userModel;
    }else{
      return null;
    }
  }

  void getCode(){
    Future.delayed(const Duration(seconds: 1),(){
      //验证码发送成功
      debugPrint("验证码发送成功");
    });
    //开始倒计时
    //_timerViewModel.timeDowner();
  }


  Future<List<CommunityModel>?> getCommunityList(int pageNo,int pageSize)async{
    var resp = await get(getCommunityUrl,{"pageNo":pageNo,"pageSize":pageSize});
    if(resp != null){
      List<Map<String, dynamic>> jsonList = List<Map<String, dynamic>>.from(resp["result"]["records"]);
      List<CommunityModel> communityList = jsonList.map((m) => CommunityModel.fromJson(m)).toList();
      return communityList;
    }else{
      return null;
    }
  }
}