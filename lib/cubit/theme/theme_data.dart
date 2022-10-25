import 'package:flutter/material.dart';

enum AppTheme {
  lightAppTheme,
  darkAppTheme,
}

final appThemeData = {
  AppTheme.darkAppTheme: ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.redAccent,
    textTheme: TextTheme(
      bodyText1: const TextStyle().copyWith(color: Colors.white),
    ),
  ),
  AppTheme.lightAppTheme: ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.greenAccent,
    textTheme: TextTheme(
      bodyText1: const TextStyle().copyWith(color: Colors.black),
    ),
  ),
};