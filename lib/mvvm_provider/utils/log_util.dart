class Log{
  static void i(String tag,dynamic msg){
      _printLog("I_$tag", msg);
  }

  static void d(String tag,dynamic msg){
    _printLog("D_$tag", msg);
  }

  static void w(String tag,dynamic msg){
    _printLog("W_$tag", msg);
  }

  static void e(String tag,dynamic msg){
    _printLog("E_$tag", msg);
  }

  static void _printLog(String tag,dynamic msg){
    print("${_getNowTime()}  $tag:  $msg");
  }

  static String _getNowTime(){
    DateTime now = DateTime.now();
    return "${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}:${now.second}:${now.millisecond}";
  }
}