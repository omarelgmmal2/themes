import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_data/home.dart';
import 'package:theme_data/localization/app_lang_bloc.dart';
import 'package:theme_data/theme/app_theme_bloc.dart';
import 'helpers/constant.dart';
import 'localization/app_localizations.dart';
import 'localization/local.dart';
import 'theme/theme_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppThemeBloc()..add(InitialEvent()),
        ),
        BlocProvider(
          create: (context) => AppLangBloc()..add(InitialLang()),
        ),
      ],
      child: BlocBuilder<AppThemeBloc, AppThemeState>(
        builder: (context, state) {
          if (state is AppLightTheme) {
            return BlocBuilder<AppLangBloc, AppLangStates>(
              builder: (context, state) {
                if (state is AppChangeLang) {
                  String local = state.langCode!;
                  return MaterialApp(
                    locale: Locale(local),
                    title: "ThemeData",
                    theme: ThemeServices().lightTheme,
                    debugShowCheckedModeBanner: false,
                    supportedLocales: const [
                      Locale("en"),
                      Locale("ar"),
                    ],
                    localizationsDelegates: [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    localeResolutionCallback: (deviceLocale, supportedLocales) {
                      for (var locale in supportedLocales) {
                        if (deviceLocale != null) {
                          if (deviceLocale.languageCode ==
                              locale.languageCode) {
                            return deviceLocale;
                          }
                        }
                      }
                      return supportedLocales.first;
                    },
                    home: const Home(),
                  );
                }
                return const SizedBox.shrink();
              },
            );
          } else if (state is AppDarkTheme) {
            return BlocBuilder<AppLangBloc, AppLangStates>(
              builder: (context, state) {
                if (state is AppChangeLang) {
                  String local = state.langCode!;
                  return MaterialApp(
                    locale: Locale(local),
                    title: "ThemeData",
                    theme: ThemeServices().darkTheme,
                    debugShowCheckedModeBanner: false,
                    home: const Home(),
                    supportedLocales: const [
                      Locale("en"),
                      Locale("ar"),
                    ],
                    localizationsDelegates: [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    localeResolutionCallback: (deviceLocale, supportedLocales) {
                      for (var locale in supportedLocales) {
                        if (deviceLocale != null) {
                          if (deviceLocale.languageCode == locale.languageCode) {
                            return deviceLocale;
                          }
                        }
                      }
                      return supportedLocales.first;
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
