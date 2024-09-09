import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../helpers/constant.dart';
part 'app_lang_event.dart';
part 'app_lang_state.dart';

class AppLangBloc extends Bloc<AppLangEvents, AppLangStates> {
  AppLangBloc() : super(AppLangInitial()) {
    on<AppLangEvents>((event, emit) {
      if (event is InitialLang) {
        if (sharedPreferences!.getString("lang") != null) {
          if (sharedPreferences!.getString("lang") == "ar") {
            emit(AppChangeLang(langCode: "ar"));
          } else {
            emit(AppChangeLang(langCode: "en"));
          }
        }
      } else if (event is ArabicLangEvent) {
        sharedPreferences!.setString("lang", "ar");
        emit(AppChangeLang(langCode: "ar"));
      } else if (event is EnglishLangEvent) {
        sharedPreferences!.setString("lang", "en");
        emit(AppChangeLang(langCode: "en"));
      }
    });
  }
}
