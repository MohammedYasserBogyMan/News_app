import 'package:flutter/material.dart';
import 'package:news_app_new_training/Presentation/widgets/custom_news.dart';
import 'package:news_app_new_training/data/Models/news_model.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    super.key,
    required this.breakingNews,
  });

  final List<NewsModel> breakingNews;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: breakingNews.length,
      itemBuilder: (context, index) {
        final newsItem = breakingNews[index];
        return CustomNewsItem(news: newsItem); // الحفاظ على CustomNewsItem
      },
    );
  }
}
