import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_new_training/logic/cubit/them/cubit/them_cubit.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            // تحديد لون النص بناءً على الوضع
            Color appBarTextColor =
                themeMode == ThemeMode.dark ? Colors.white : Colors.black;

            return Center(
              child: Text(
                'الإعدادات',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    fontSize: 20, color: appBarTextColor), // تطبيق اللون هنا
              ),
            );
          },
        ),
      ),
      body: Center(
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            // تحديد لون النص بناءً على الوضع
            Color textColor =
                themeMode == ThemeMode.dark ? Colors.white : Colors.black;

            return SwitchListTile(
              title: Text(
                'الوضع الداكن',
                style: TextStyle(color: textColor), // تطبيق اللون هنا
              ),
              value: themeMode == ThemeMode.dark,
              onChanged: (bool value) {
                context.read<ThemeCubit>().toggleTheme(value);
              },
              activeColor: Colors.blue, // لون الزر عند تفعيله
              secondary: Icon(
                themeMode == ThemeMode.dark
                    ? Icons.dark_mode
                    : Icons.light_mode,
                color: textColor, // استخدام لون النص
              ),
            );
          },
        ),
      ),
    );
  }
}
