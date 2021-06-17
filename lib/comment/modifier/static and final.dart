//使用const表示的是編譯時常量，final表示運行時常量。
//
//const修飾的常量必須在聲明時初始化，並且是可以確定的值，不是需要經過計算的值。
//final修飾的常量必須在聲明進初始化或者在構造函數中初始化，它的值可以動態計算。
//
//共同點是兩者賦值後就不能再修改(不能重新賦值，對於引用類型可以修改屬性)。

/*
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

void main() {
  const test1 = "hello"; //正確，編譯期常量
  final test2 = "hello"; //正確，運行時常量

  const test3 = DateTime.now(); //編譯報錯,值不是編譯期常量
  final test4 = DateTime.now(); //正確，運行時常量

  const test5 = new List(); //編譯報錯,值不是編譯期常量
  final test6 = new List(); //正確，運行時常量
}
*/