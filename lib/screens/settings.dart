import 'package:demo/cubit/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
          onPressed: () {
            context.read<ThemeCubit>().toggleTheme(!context.read<ThemeCubit>().state.isDarkThemeOn);
            print(context.read<ThemeCubit>().state.isDarkThemeOn);
          },
          child: const Text("Toggle Theme"),
        ),
      ),
    );
  }
}
