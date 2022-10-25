import 'package:demo/bloc/download/download_bloc.dart';
import 'package:demo/repositories/download_repo.dart';
import 'package:demo/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/theme/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initiating repositories
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => DownloadRepository())
      ],
      // Initiating Blocs and Cubits
      child: MultiBlocProvider(
        providers: [
          BlocProvider<DownloadBloc>(
              create: (context) => DownloadBloc(
                  downloadRepository: context.read<DownloadRepository>())),
          BlocProvider<ThemeCubit>(create: (context) => ThemeCubit())
        ],
        // Creating a Universal Listener for theme changes
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Demo App',
              // Here is what manages the theme
              theme: state.theme,
              home: const Home(),
            );
          },
        ),
      ),
    );
  }
}
