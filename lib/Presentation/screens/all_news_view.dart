import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_new_training/Presentation/widgets/news_list_view.dart';
import 'package:news_app_new_training/logic/cubit/cubit/breaking_news_cubit.dart';
import 'package:news_app_new_training/logic/cubit/them/cubit/them_cubit.dart';

class AllNewsView extends StatelessWidget {
  const AllNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        Color appBarColor =
            themeMode == ThemeMode.dark ? Colors.black : Colors.white;
        Color textColor =
            themeMode == ThemeMode.dark ? Colors.white : Colors.black;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: appBarColor,
            title: Center(
              child: Text(
                'الاخبار',
                textDirection: TextDirection.rtl,
                style: TextStyle(color: textColor),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BlocBuilder<BreakingNewsCubit, BreakingNewsState>(
              builder: (context, state) {
                if (state is BreakingNewsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is BreakingNewsLoaded) {
                  return NewsListView(breakingNews: state.breakingNews);
                } else if (state is BreakingNewsError) {
                  return Center(child: Text('خطأ: ${state.toString()}'));
                } else {
                  return Container();
                }
              },
            ),
          ),
        );
      },
    );
  }
}
