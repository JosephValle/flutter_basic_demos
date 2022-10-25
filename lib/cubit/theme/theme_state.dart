part of 'theme_cubit.dart';

class ThemeState {
  final bool isDarkThemeOn;
  ThemeData? theme;

  ThemeState({required this.isDarkThemeOn}) {
    if (isDarkThemeOn) {
      theme = appThemeData[AppTheme.darkAppTheme]!;
    } else {
      theme = appThemeData[AppTheme.lightAppTheme]!;
    }
  }

  ThemeState copyWith({required bool changeState}) {
    return ThemeState(isDarkThemeOn: changeState);
  }
}
