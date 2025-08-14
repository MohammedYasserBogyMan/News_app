import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app_new_training/Presentation/screens/book_mark_view.dart';
import 'package:news_app_new_training/Presentation/screens/home_contant.dart';
import 'package:news_app_new_training/Presentation/screens/profile_view.dart';
import 'package:news_app_new_training/logic/cubit/cubit/breaking_news_cubit.dart';
import 'package:news_app_new_training/logic/cubit/news/news_cubit.dart';
import 'package:news_app_new_training/logic/cubit/them/cubit/them_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 2;

  final List<Widget> _pages = [
    const SettingsView(),
    const BookmarksPage(),
    const HomeContent(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<BreakingNewsCubit>(context).getBreakingNews();
      BlocProvider.of<NewsCubit>(context).getNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        final isDarkMode = themeMode == ThemeMode.dark;

        return Scaffold(
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.black : Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.3),
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  backgroundColor: isDarkMode ? Colors.black : Colors.white,
                  gap: 8,
                  activeColor: Colors.white,
                  iconSize: 24,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  tabBackgroundColor: Colors.blue[300]!,
                  color: isDarkMode ? Colors.white : Colors.black,
                  tabs: const [
                    GButton(
                      icon: Icons.person_outline,
                      text: 'حسابي',
                    ),
                    GButton(
                      icon: Icons.bookmark_border,
                      text: 'المحفوظات',
                    ),
                    GButton(
                      icon: Icons.home_outlined,
                      text: 'الصفحه الرئيسيه',
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: _pages[_selectedIndex],
          ),
        );
      },
    );
  }
}
