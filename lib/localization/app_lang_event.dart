part of 'app_lang_bloc.dart';

@immutable
abstract class AppLangEvents {}

class InitialLang extends AppLangEvents {}
class ArabicLangEvent extends AppLangEvents {}
class EnglishLangEvent extends AppLangEvents {}

//بعمل ال event  علي حسب عدد اللغات اللي عندي
