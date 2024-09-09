import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_data/localization/app_lang_bloc.dart';
import 'package:theme_data/localization/app_localizations.dart';

class Local extends StatelessWidget {
  const Local({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                AppLocalizations.of(context)!.translate("1")
            ),
            const SizedBox(height: 16,),
            ElevatedButton(
              onPressed: (){
                BlocProvider.of<AppLangBloc>(context).add(EnglishLangEvent());
              },
              child: const Text(
                "En",
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: (){
                BlocProvider.of<AppLangBloc>(context).add(ArabicLangEvent());
              },
              child: const Text(
                "ar",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
