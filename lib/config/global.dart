library my_prj.globals;

import 'package:flutter/material.dart';

import '../components/myTheme.dart';

MyTheme currentTheme = MyTheme();

//ThemeData darkTheme = ThemeData(
//    accentColor: Colors.orange,
//    primaryColor: Colors.white,
//    brightness: Brightness.dark);

//ThemeData lightTheme = ThemeData(
//    accentColor: Colors.orange,
//    primaryColor: Colors.black,
//    brightness: Brightness.light);

ThemeData darkTheme = ThemeData.dark();
ThemeData lightTheme = ThemeData.light();

Image img = Image(image: AssetImage('assets/img/profilepicture.png'));
