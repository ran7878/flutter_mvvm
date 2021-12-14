class Log{
  static String _getNowTime(){
    DateTime now = DateTime.now();
    return "${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}:${now.second}:${now.millisecond}";
  }
  static void i(String tag,dynamic msg){
      print("${_getNowTime()}  I_$tag:  $msg");
  }

  static void d(String tag,dynamic msg){
    print("${_getNowTime()}  D_$tag:  $msg");
  }

  static void w(String tag,dynamic msg){
    print("${_getNowTime()}  W_$tag:  $msg");
  }

  static void e(String tag,dynamic msg){
    print("${_getNowTime()}  E_$tag:  $msg");
  }
}