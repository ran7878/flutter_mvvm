class CommunityModel {
  String? id;
  String? createTime;
  String? updateTime;
  String? createBy;
  String? updateBy;
  String? delFlag;
  String? communityNm;
  String? communityId;
  String? buildingType;
  String? unitType;
  String? buildingAddr;
  String? buildingTelno;
  String? roomType;

  //是否认证
  bool isVerify = false;
  String? buildingNoSimple;
  String? roomNoSimple;
  String? communityLat = "0";
  String? communityLng = "0";

  CommunityModel({
    this.id,
    this.createTime,
    this.updateTime,
    this.createBy,
    this.updateBy,
    this.delFlag,
    this.communityNm,
    this.communityId,
    this.buildingType,
    this.unitType,
    this.buildingAddr,
    this.communityLat,
    this.communityLng,
    this.buildingTelno,
    this.roomType,
    this.buildingNoSimple,
    this.roomNoSimple,
  });

  CommunityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    createBy = json['createBy'];
    updateBy = json['updateBy'];
    delFlag = json['delFlag'];
    communityNm = json['communityNm'];
    communityId = json['communityId'];
    buildingType = json['buildingType'];
    unitType = json['unitType'];
    buildingAddr = json['buildingAddr'];
    communityLat = json['communityLat'];
    communityLng = json['communityLng'];
    buildingTelno = json['buildingTelno'];
    roomType = json['roomType'];
    buildingNoSimple = json['buildingNoSimple'];
    roomNoSimple = json['roomNoSimple'];
  }
}




