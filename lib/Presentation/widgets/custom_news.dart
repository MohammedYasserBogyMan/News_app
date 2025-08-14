import 'package:flutter/material.dart';
import 'package:news_app_new_training/Presentation/screens/news_detils_view.dart';
import 'package:news_app_new_training/data/Models/news_model.dart';

class CustomNewsItem extends StatelessWidget {
  CustomNewsItem({super.key, required this.news});
  final NewsModel news;

  final Map<String, String> categoryTranslations = {
    'technology': 'تكنولوجيا',
    'sports': 'رياضة',
    'business': 'أعمال',
    'health': 'صحة',
    'entertainment': 'ترفيه',
    'top': 'أهم الأخبار',
    // يمكنك إضافة المزيد من الفئات حسب الحاجة
  };

  String translateCategory(String? category) {
    return categoryTranslations[category?.toLowerCase() ?? ''] ?? 'أخبار';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return NewsDetilsView(
            newsitem: news,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: SizedBox(
                height: 140,
                width: 150,
                child: Image.network(
                  news.image ??
                      'https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return Image.network(
                      'https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 5),
                  Text(
                    translateCategory(news.category),
                  ), // عنوان الفئة
                  const SizedBox(height: 15),
                  Text(
                    news.titel ?? 'لا يوجد عنوان هنا', // العنوان
                    style: const TextStyle(
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                    textDirection: TextDirection.rtl, // ضبط اتجاه النص
                  ),
                  const SizedBox(height: 10),
                  Text(
                    news.date ?? 'لا يوجد تاريخ متاح', // التاريخ
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
