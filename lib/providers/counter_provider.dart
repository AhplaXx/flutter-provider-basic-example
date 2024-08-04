import 'package:flutter/foundation.dart';



class Counter with ChangeNotifier{

  int _data = 0;
  int get data => _data;
  void increment(){
    _data++;
    notifyListeners();
  }
  void decrement(){
    _data--;
    notifyListeners();
  }
}