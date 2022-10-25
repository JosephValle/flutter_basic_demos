import 'package:flutter/material.dart';

enum AppTheme {
  LightAppTheme,
  DarkAppTheme,
}

final appThemeData = {
  AppTheme.DarkAppTheme: ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.redAccent,
    textTheme: TextTheme(
      bodyText1: const TextStyle().copyWith(color: Colors.white),
    ),
  ),
  AppTheme.LightAppTheme: ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.greenAccent,
    textTheme: TextTheme(
      bodyText1: const TextStyle().copyWith(color: Colors.black),
    ),
  ),
};