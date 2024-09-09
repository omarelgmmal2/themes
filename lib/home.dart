import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_data/theme/app_theme_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isDarkMode = false;

  toggle(){
    if(isDarkMode == true){
      context.read<AppThemeBloc>().add(DarkEvent());
      isDarkMode = false;
    }else if(isDarkMode == false ){
      context.read<AppThemeBloc>().add(LightEvent());
      isDarkMode = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: toggle,
                icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
            ),
            ElevatedButton(
                onPressed: (){
                  BlocProvider.of<AppThemeBloc>(context).add(DarkEvent());
                },
                child: const Text(
                    "Dark Theme",
                ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: (){
                BlocProvider.of<AppThemeBloc>(context).add(LightEvent());
              },
              child: const Text(
                "Light Theme",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
