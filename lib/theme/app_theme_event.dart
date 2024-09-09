part of 'app_theme_bloc.dart';

@immutable
abstract class AppThemeEvent {}

class InitialEvent extends AppThemeEvent {}
class LightEvent extends AppThemeEvent {}
class DarkEvent extends AppThemeEvent {}
