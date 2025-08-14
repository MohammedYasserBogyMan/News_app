import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_new_training/Presentation/screens/splash_view.dart';
import 'package:news_app_new_training/logic/cubit/bookmars/book_mark_cubit.dart';
import 'package:news_app_new_training/logic/cubit/cubit/breaking_news_cubit.dart';
import 'package:news_app_new_training/logic/cubit/news/news_cubit.dart';
import 'package:news_app_new_training/logic/cubit/them/cubit/them_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit(),
        ),
        BlocProvider(
          create: (context) => BreakingNewsCubit(),
        ),
        BlocProvider(
          create: (context) => BookmarkCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            locale: const Locale('ar', ''),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              fontFamily: 'IBMPlexSansArabic',
              textTheme: const TextTheme(
                bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
                bodyMedium: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: Colors.black,
              fontFamily: 'IBMPlexSansArabic',
              textTheme: const TextTheme(
                bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
                bodyMedium: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            themeMode: themeMode,
            home: const SplashView(),
          );
        },
      ),
    );
  }
}
