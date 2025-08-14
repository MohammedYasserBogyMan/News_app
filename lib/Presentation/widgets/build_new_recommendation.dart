import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_new_training/Presentation/widgets/news_list_view.dart';
import 'package:news_app_new_training/logic/cubit/news/news_cubit.dart';

Widget buildNewsRecommendations() {
  return BlocBuilder<NewsCubit, NewsState>(
    builder: (context, state) {
      if (state is NewsLoading) {
        return const Center(
            child: CircularProgressIndicator(
          color: Color.fromARGB(255, 144, 202, 249),
        ));
      } else if (state is NewsLoaded) {
        final newsList = state.news;
        return SizedBox(
          height: 330,
          child: newsList.isNotEmpty
              ? NewsListView(breakingNews: newsList)
              : const Center(child: Text('No recommended news available')),
        );
      } else if (state is NewsError) {
        return Center(child: Text('Error loading news: ${state.errMessage}'));
      } else {
        return const Center(child: Text('Loading news...'));
      }
    },
  );
}
