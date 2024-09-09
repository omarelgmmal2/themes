import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:theme_data/helpers/constant.dart';
part 'app_theme_event.dart';
part 'app_theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc() : super(AppThemeInitial()) {
    on<AppThemeEvent>((event, emit) {
      if (event is InitialEvent) {
        if (sharedPreferences != null) {
          if (sharedPreferences!.getString("theme") == "light") {
            emit(AppLightTheme(themeData: "light"));
          } else {
            emit(AppDarkTheme(themeData: "dark"));
          }
        }
      } else if (event is LightEvent) {
        sharedPreferences!.setString("theme", "light");
        emit(AppLightTheme(themeData: "light"));
      } else if (event is DarkEvent) {
        sharedPreferences!.setString("theme", "dark");
        emit(AppDarkTheme(themeData: "dark"));
      }
    });
  }
}
