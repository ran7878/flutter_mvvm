/// success : true
/// message : "登录成功。"
/// code : 200
/// result : null
/// timestamp : 1639461180895

class BaseBean {
  BaseBean({
      this.success, 
      this.message, 
      this.code, 
      this.result, 
      this.timestamp,});

  BaseBean.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
    result = json['result'];
    timestamp = json['timestamp'];
  }
  bool? success;
  String? message;
  int? code;
  dynamic result;
  int? timestamp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['code'] = code;
    map['result'] = result;
    map['timestamp'] = timestamp;
    return map;
  }

}