import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_new_training/Presentation/widgets/slider_image.dart';
import 'package:news_app_new_training/logic/cubit/cubit/breaking_news_cubit.dart';

Widget buildBreakingNews() {
  return BlocBuilder<BreakingNewsCubit, BreakingNewsState>(
    builder: (context, state) {
      if (state is BreakingNewsLoading) {
        return const Center(
            child: CircularProgressIndicator(
          color: Color.fromARGB(255, 144, 202, 249),
        ));
      } else if (state is BreakingNewsLoaded) {
        final breakingNews = state.breakingNews;
        return Column(
          children: [
            if (breakingNews.isNotEmpty)
              SizedBox(
                height: 220,
                width: MediaQuery.of(context).size.width,
                child: CustomSliderImage(newsList: breakingNews),
              )
            else
              const Center(child: Text('لا توجد أخبار عاجلة متاحة')),
          ],
        );
      } else if (state is BreakingNewsError) {
        return Center(child: Text('خطأ: ${state.error}'));
      } else {
        return const Center(child: Text('حدث خطأ في تحميل الأخبار'));
      }
    },
  );
}
