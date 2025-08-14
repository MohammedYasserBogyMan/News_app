import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app_new_training/data/Models/news_model.dart';

class NewsServices {
  final Dio dio = Dio();

  Future<List<NewsModel>> getAllNews() async {
    try {
      final Response response = await dio.get(
          "https://newsdata.io/api/1/latest?apikey=pub_5430137d0f931e0d71b0568e3c43c222c3dfb&country=eg&language=ar");

      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['results'];

      List<NewsModel> articleList = [];
      for (var article in articles) {
        NewsModel art = NewsModel(
            date: article['pubDate'],
            titel: article['title'],
            desc: article['description'],
            image: article['image_url'],
            author: article['creator'] is List
                ? (article['creator'] as List).join(', ')
                : article['creator'], // تحويل القائمة إلى نص
            contant: article['content'],
            category: article['category'][0] // تحويل القائمة إلى نص
            );
        articleList.add(art);
      }
      return articleList;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw Exception('فشل في تحميل الأخبار: $e');
    }
  }

  Future<List<NewsModel>> getBreakingNews() async {
    try {
      final Response response = await dio.get(
          "https://newsdata.io/api/1/latest?apikey=pub_5430137d0f931e0d71b0568e3c43c222c3dfb&language=ar");

      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['results'];

      List<NewsModel> articleList = [];
      for (var article in articles) {
        NewsModel art = NewsModel(
            date: article['pubDate'],
            titel: article['title'],
            desc: article['description'],
            image: article['image_url'],
            author: article['creator'] is List
                ? (article['creator'] as List).join(', ')
                : article['creator'], // تحويل القائمة إلى نص
            contant: article['content'],
            category: article['category'][0] // تحويل القائمة إلى نص
            );
        articleList.add(art);
      }
      return articleList;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw Exception('فشل في تحميل الأخبار: $e');
    }
  }
}
