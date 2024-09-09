part of 'app_lang_bloc.dart';

@immutable
abstract class AppLangStates {}

class AppLangInitial extends AppLangStates {}

class AppChangeLang extends AppLangStates{
  final String? langCode;

  AppChangeLang({this.langCode});
}
