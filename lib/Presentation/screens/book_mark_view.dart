import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_new_training/Presentation/widgets/news_list_view.dart';
import 'package:news_app_new_training/data/Models/bookmark_model.dart';
import 'package:news_app_new_training/data/Models/news_model.dart';
import 'package:news_app_new_training/logic/cubit/bookmars/book_mark_cubit.dart';
import 'package:news_app_new_training/logic/cubit/them/cubit/them_cubit.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, state) {
            // تحديد لون النص بناءً على الوضع
            Color textColor =
                state == ThemeMode.dark ? Colors.white : Colors.black;

            return Text(
              'المحفوظات',
              style: TextStyle(color: textColor),
            );
          },
        ),
      ),
      body: BlocBuilder<BookmarkCubit, List<Bookmark>>(
        builder: (context, bookmarks) {
          if (bookmarks.isEmpty) {
            return const Center(
              child: Text(
                '!لا توجد عناصر محفوظه',
                style: TextStyle(fontSize: 20),
              ),
            );
          } else {
            // تحويل قائمة الـ Bookmark إلى قائمة من نوع NewsModel
            List<NewsModel> newsList = bookmarks.map((bookmark) {
              return NewsModel(
                category: '',
                author: 'موقع اخبارك',
                contant: '',
                titel: bookmark.title,
                desc: bookmark.desc,
                image: bookmark.image,
                date: '2024-08-20',
              );
            }).toList();

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: NewsListView(breakingNews: newsList),
            );
          }
        },
      ),
    );
  }
}
