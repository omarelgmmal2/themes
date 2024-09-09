part of 'app_theme_bloc.dart';

@immutable
abstract class AppThemeState {}

class AppThemeInitial extends AppThemeState {}

class AppLightTheme extends AppThemeState {
  final String? themeData;

  AppLightTheme({required this.themeData});
}

class AppDarkTheme extends AppThemeState {
  final String? themeData;

  AppDarkTheme({required this.themeData});
}
