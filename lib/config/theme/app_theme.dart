import 'package:flutter/material.dart';

class AppTheme {

  final Color seedColor;

  AppTheme({this.seedColor = Colors.blue});
  
  ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: seedColor,
    brightness: Brightness.light,
  );
  
  ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: seedColor,
    brightness: Brightness.dark,
  );
  
}