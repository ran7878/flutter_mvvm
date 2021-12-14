/// success : true
/// message : "登录成功。"
/// code : 200
/// result : {"certInfo":[{"id":"1459502815093297153","createTime":"2021-11-13","updateTime":"2021-11-13","createBy":"2c9180827c9712c6017c9712c66f0000","updateBy":"e9ca23d68d884d4ebb19d07889727dae","delFlag":0,"customerId":"2c9180827c9712c6017c9712c66f0000","nickname":"业主15501393136","realname":"曹广东","phone":"15501393136","city":"","communityId":"5","community":"汇置尚都四期","building":"5","unit":"","roomId":"7355","room":"103","voiceprint":"","face":"","userIdentity":0,"idType":"0","idNo":"411425198911292415","certDate":"2021-11-13 20:46:02","certAuditSts":1,"certAuditBy":"e9ca23d68d884d4ebb19d07889727dae","certAuditDate":"2021-11-13","faceRecSts":0,"voiceNumber":null},{"id":"1456468049532100609","createTime":"2021-11-05","updateTime":"2021-11-05","createBy":"2c9180827c9712c6017c9712c66f0000","updateBy":"e9ca23d68d884d4ebb19d07889727dae","delFlag":0,"customerId":"2c9180827c9712c6017c9712c66f0000","nickname":"业主15501393136","realname":"曹广东","phone":"15501393136","city":"","communityId":"10","community":"汇置尚都六期","building":"3","unit":"1","roomId":"12437","room":"1-1-1","voiceprint":"","face":"","userIdentity":0,"idType":"0","idNo":"411425198911292415","certDate":"2021-11-05 11:46:58","certAuditSts":1,"certAuditBy":"e9ca23d68d884d4ebb19d07889727dae","certAuditDate":"2021-11-05","faceRecSts":0,"voiceNumber":null}],"customerInfo":{"id":"2c9180827c9712c6017c9712c66f0000","createTime":"2021-10-19 13:42:43","updateTime":"2021-11-13 20:46:26","createBy":null,"updateBy":"e9ca23d68d884d4ebb19d07889727dae","delFlag":0,"avatar":null,"username":"15501393136","nickname":"业主15501393136","realname":"曹广东","phone":"15501393136","sex":null,"password":null,"salt":null,"regDate":"2021-10-19 13:42:43","certAuditSts":1,"disableSts":0,"pwdSts":0,"qrcode":"https://aispeech-aicity.oss-cn-hangzhou.aliyuncs.com/qrcode/image81712593178.PNG","captcha":null,"oldPassword":null,"confirmPassword":null},"access-token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mzk0NjI5ODAsInVzZXJuYW1lIjoiMTU1MDEzOTMxMzYifQ.fwa6AkQ3EHGwUzICkJeXFRr6ld9KW7dIFNvapXfvcG8"}
/// timestamp : 1639461180895

class UserModel {
  UserModel({
      this.success, 
      this.message, 
      this.code, 
      this.result, 
      this.timestamp,});

  UserModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    timestamp = json['timestamp'];
  }
  bool? success;
  String? message;
  int? code;
  Result? result;
  int? timestamp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['code'] = code;
    if (result != null) {
      map['result'] = result?.toJson();
    }
    map['timestamp'] = timestamp;
    return map;
  }

}

/// certInfo : [{"id":"1459502815093297153","createTime":"2021-11-13","updateTime":"2021-11-13","createBy":"2c9180827c9712c6017c9712c66f0000","updateBy":"e9ca23d68d884d4ebb19d07889727dae","delFlag":0,"customerId":"2c9180827c9712c6017c9712c66f0000","nickname":"业主15501393136","realname":"曹广东","phone":"15501393136","city":"","communityId":"5","community":"汇置尚都四期","building":"5","unit":"","roomId":"7355","room":"103","voiceprint":"","face":"","userIdentity":0,"idType":"0","idNo":"411425198911292415","certDate":"2021-11-13 20:46:02","certAuditSts":1,"certAuditBy":"e9ca23d68d884d4ebb19d07889727dae","certAuditDate":"2021-11-13","faceRecSts":0,"voiceNumber":null},{"id":"1456468049532100609","createTime":"2021-11-05","updateTime":"2021-11-05","createBy":"2c9180827c9712c6017c9712c66f0000","updateBy":"e9ca23d68d884d4ebb19d07889727dae","delFlag":0,"customerId":"2c9180827c9712c6017c9712c66f0000","nickname":"业主15501393136","realname":"曹广东","phone":"15501393136","city":"","communityId":"10","community":"汇置尚都六期","building":"3","unit":"1","roomId":"12437","room":"1-1-1","voiceprint":"","face":"","userIdentity":0,"idType":"0","idNo":"411425198911292415","certDate":"2021-11-05 11:46:58","certAuditSts":1,"certAuditBy":"e9ca23d68d884d4ebb19d07889727dae","certAuditDate":"2021-11-05","faceRecSts":0,"voiceNumber":null}]
/// customerInfo : {"id":"2c9180827c9712c6017c9712c66f0000","createTime":"2021-10-19 13:42:43","updateTime":"2021-11-13 20:46:26","createBy":null,"updateBy":"e9ca23d68d884d4ebb19d07889727dae","delFlag":0,"avatar":null,"username":"15501393136","nickname":"业主15501393136","realname":"曹广东","phone":"15501393136","sex":null,"password":null,"salt":null,"regDate":"2021-10-19 13:42:43","certAuditSts":1,"disableSts":0,"pwdSts":0,"qrcode":"https://aispeech-aicity.oss-cn-hangzhou.aliyuncs.com/qrcode/image81712593178.PNG","captcha":null,"oldPassword":null,"confirmPassword":null}
/// access-token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mzk0NjI5ODAsInVzZXJuYW1lIjoiMTU1MDEzOTMxMzYifQ.fwa6AkQ3EHGwUzICkJeXFRr6ld9KW7dIFNvapXfvcG8"

class Result {
  Result({
      this.certInfo, 
      this.customerInfo, 
      this.access_token,});

  Result.fromJson(dynamic json) {
    if (json['certInfo'] != null) {
      certInfo = [];
      json['certInfo'].forEach((v) {
        certInfo?.add(CertInfo.fromJson(v));
      });
    }
    customerInfo = json['customerInfo'] != null ? CustomerInfo.fromJson(json['customerInfo']) : null;
    access_token = json['access-token'];
  }
  List<CertInfo>? certInfo;
  CustomerInfo? customerInfo;
  String? access_token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (certInfo != null) {
      map['certInfo'] = certInfo?.map((v) => v.toJson()).toList();
    }
    if (customerInfo != null) {
      map['customerInfo'] = customerInfo?.toJson();
    }
    map['access-token'] = access_token;
    return map;
  }

}

/// id : "2c9180827c9712c6017c9712c66f0000"
/// createTime : "2021-10-19 13:42:43"
/// updateTime : "2021-11-13 20:46:26"
/// createBy : null
/// updateBy : "e9ca23d68d884d4ebb19d07889727dae"
/// delFlag : 0
/// avatar : null
/// username : "15501393136"
/// nickname : "业主15501393136"
/// realname : "曹广东"
/// phone : "15501393136"
/// sex : null
/// password : null
/// salt : null
/// regDate : "2021-10-19 13:42:43"
/// certAuditSts : 1
/// disableSts : 0
/// pwdSts : 0
/// qrcode : "https://aispeech-aicity.oss-cn-hangzhou.aliyuncs.com/qrcode/image81712593178.PNG"
/// captcha : null
/// oldPassword : null
/// confirmPassword : null

class CustomerInfo {
  CustomerInfo({
      this.id, 
      this.createTime, 
      this.updateTime, 
      this.createBy, 
      this.updateBy, 
      this.delFlag, 
      this.avatar, 
      this.username, 
      this.nickname, 
      this.realname, 
      this.phone, 
      this.sex, 
      this.password, 
      this.salt, 
      this.regDate, 
      this.certAuditSts, 
      this.disableSts, 
      this.pwdSts, 
      this.qrcode, 
      this.captcha, 
      this.oldPassword, 
      this.confirmPassword,});

  CustomerInfo.fromJson(dynamic json) {
    id = json['id'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    createBy = json['createBy'];
    updateBy = json['updateBy'];
    delFlag = json['delFlag'];
    avatar = json['avatar'];
    username = json['username'];
    nickname = json['nickname'];
    realname = json['realname'];
    phone = json['phone'];
    sex = json['sex'];
    password = json['password'];
    salt = json['salt'];
    regDate = json['regDate'];
    certAuditSts = json['certAuditSts'];
    disableSts = json['disableSts'];
    pwdSts = json['pwdSts'];
    qrcode = json['qrcode'];
    captcha = json['captcha'];
    oldPassword = json['oldPassword'];
    confirmPassword = json['confirmPassword'];
  }
  String? id;
  String? createTime;
  String? updateTime;
  dynamic createBy;
  String? updateBy;
  int? delFlag;
  dynamic avatar;
  String? username;
  String? nickname;
  String? realname;
  String? phone;
  dynamic sex;
  dynamic password;
  dynamic salt;
  String? regDate;
  int? certAuditSts;
  int? disableSts;
  int? pwdSts;
  String? qrcode;
  dynamic captcha;
  dynamic oldPassword;
  dynamic confirmPassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createTime'] = createTime;
    map['updateTime'] = updateTime;
    map['createBy'] = createBy;
    map['updateBy'] = updateBy;
    map['delFlag'] = delFlag;
    map['avatar'] = avatar;
    map['username'] = username;
    map['nickname'] = nickname;
    map['realname'] = realname;
    map['phone'] = phone;
    map['sex'] = sex;
    map['password'] = password;
    map['salt'] = salt;
    map['regDate'] = regDate;
    map['certAuditSts'] = certAuditSts;
    map['disableSts'] = disableSts;
    map['pwdSts'] = pwdSts;
    map['qrcode'] = qrcode;
    map['captcha'] = captcha;
    map['oldPassword'] = oldPassword;
    map['confirmPassword'] = confirmPassword;
    return map;
  }

}

/// id : "1459502815093297153"
/// createTime : "2021-11-13"
/// updateTime : "2021-11-13"
/// createBy : "2c9180827c9712c6017c9712c66f0000"
/// updateBy : "e9ca23d68d884d4ebb19d07889727dae"
/// delFlag : 0
/// customerId : "2c9180827c9712c6017c9712c66f0000"
/// nickname : "业主15501393136"
/// realname : "曹广东"
/// phone : "15501393136"
/// city : ""
/// communityId : "5"
/// community : "汇置尚都四期"
/// building : "5"
/// unit : ""
/// roomId : "7355"
/// room : "103"
/// voiceprint : ""
/// face : ""
/// userIdentity : 0
/// idType : "0"
/// idNo : "411425198911292415"
/// certDate : "2021-11-13 20:46:02"
/// certAuditSts : 1
/// certAuditBy : "e9ca23d68d884d4ebb19d07889727dae"
/// certAuditDate : "2021-11-13"
/// faceRecSts : 0
/// voiceNumber : null

class CertInfo {
  CertInfo({
      this.id, 
      this.createTime, 
      this.updateTime, 
      this.createBy, 
      this.updateBy, 
      this.delFlag, 
      this.customerId, 
      this.nickname, 
      this.realname, 
      this.phone, 
      this.city, 
      this.communityId, 
      this.community, 
      this.building, 
      this.unit, 
      this.roomId, 
      this.room, 
      this.voiceprint, 
      this.face, 
      this.userIdentity, 
      this.idType, 
      this.idNo, 
      this.certDate, 
      this.certAuditSts, 
      this.certAuditBy, 
      this.certAuditDate, 
      this.faceRecSts, 
      this.voiceNumber,});

  CertInfo.fromJson(dynamic json) {
    id = json['id'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    createBy = json['createBy'];
    updateBy = json['updateBy'];
    delFlag = json['delFlag'];
    customerId = json['customerId'];
    nickname = json['nickname'];
    realname = json['realname'];
    phone = json['phone'];
    city = json['city'];
    communityId = json['communityId'];
    community = json['community'];
    building = json['building'];
    unit = json['unit'];
    roomId = json['roomId'];
    room = json['room'];
    voiceprint = json['voiceprint'];
    face = json['face'];
    userIdentity = json['userIdentity'];
    idType = json['idType'];
    idNo = json['idNo'];
    certDate = json['certDate'];
    certAuditSts = json['certAuditSts'];
    certAuditBy = json['certAuditBy'];
    certAuditDate = json['certAuditDate'];
    faceRecSts = json['faceRecSts'];
    voiceNumber = json['voiceNumber'];
  }
  String? id;
  String? createTime;
  String? updateTime;
  String? createBy;
  String? updateBy;
  int? delFlag;
  String? customerId;
  String? nickname;
  String? realname;
  String? phone;
  String? city;
  String? communityId;
  String? community;
  String? building;
  String? unit;
  String? roomId;
  String? room;
  String? voiceprint;
  String? face;
  int? userIdentity;
  String? idType;
  String? idNo;
  String? certDate;
  int? certAuditSts;
  String? certAuditBy;
  String? certAuditDate;
  int? faceRecSts;
  dynamic voiceNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createTime'] = createTime;
    map['updateTime'] = updateTime;
    map['createBy'] = createBy;
    map['updateBy'] = updateBy;
    map['delFlag'] = delFlag;
    map['customerId'] = customerId;
    map['nickname'] = nickname;
    map['realname'] = realname;
    map['phone'] = phone;
    map['city'] = city;
    map['communityId'] = communityId;
    map['community'] = community;
    map['building'] = building;
    map['unit'] = unit;
    map['roomId'] = roomId;
    map['room'] = room;
    map['voiceprint'] = voiceprint;
    map['face'] = face;
    map['userIdentity'] = userIdentity;
    map['idType'] = idType;
    map['idNo'] = idNo;
    map['certDate'] = certDate;
    map['certAuditSts'] = certAuditSts;
    map['certAuditBy'] = certAuditBy;
    map['certAuditDate'] = certAuditDate;
    map['faceRecSts'] = faceRecSts;
    map['voiceNumber'] = voiceNumber;
    return map;
  }

}