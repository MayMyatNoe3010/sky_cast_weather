import 'package:flutter/material.dart';

class Styles{
  static  const Color customCalendar1 =  Color.fromRGBO(255, 182, 193, 1);
  static const Color customCalendar2 = Color.fromRGBO(248, 200, 220, 1);

  static const Color primaryColor = Color.fromRGBO(219,180,180,1);
  static const Color primaryVarient = Color.fromRGBO(204,149,149,1);
  static const Color customBackground = Color.fromRGBO(248, 200, 220,0.3);

  static TextStyle getStringDeco(bool isComplete){
  if(isComplete) {
  return const TextStyle(decoration: TextDecoration.lineThrough);
  }else{
  return const TextStyle(decoration: TextDecoration.none);
  }
  }
}