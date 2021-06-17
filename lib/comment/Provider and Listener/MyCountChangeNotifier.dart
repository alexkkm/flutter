import 'package:flutter/foundation.dart';

class MyCountChangeNotifier with ChangeNotifier {
  // 設定一個整數私有變數 _count的欄位，初值為零
  int _count = 0;

  //可以透過 Consumer 來獲得當下 count 值
  int get count => _count;

  //當點擊右下角＋ 浮動按鈕，會呼叫此方法
  //此方法會將 _count 累加 1，並叫 notifyListeners
  increment() {
    _count++;
    notifyListeners();
  }
}
