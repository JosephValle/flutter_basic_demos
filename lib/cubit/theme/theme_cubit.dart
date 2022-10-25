import 'package:bloc/bloc.dart';
import 'package:demo/cubit/theme/theme_data.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(isDarkThemeOn: false));

  toggleTheme(bool value) => emit(state.copyWith(changeState: value));
}
