import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light) {
    _loadThemePreference();
  }

  void toggleTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    if (isDark) {
      emit(ThemeMode.dark);
      prefs.setBool('isDarkMode', true);
    } else {
      emit(ThemeMode.light);
      prefs.setBool('isDarkMode', false);
    }
  }

  Future<void> _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;
    emit(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }
}
