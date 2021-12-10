import 'package:flutter/cupertino.dart';

class Counter extends ChangeNotifier{
  int value = 0;

  void add(){
    value ++;
    notifyListeners();
  }
  void reset(){
    value =0;
    notifyListeners();
  }
}