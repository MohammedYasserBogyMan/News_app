import 'package:flutter/material.dart';
import 'package:news_app_new_training/data/Models/news_model.dart';

class DraggableSheetScroll extends StatelessWidget {
  final NewsModel newsitem;

  const DraggableSheetScroll({
    super.key,
    required this.newsitem,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.50,
      minChildSize: 0.5,
      maxChildSize: 0.6,
      builder: (BuildContext context, ScrollController scrollController) {
        final theme = Theme.of(context);

        return Container(
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 20,
                spreadRadius: 15,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textDirection: TextDirection.ltr,
                  newsitem.author ?? 'اخبار عامه',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.bodyLarge?.color,
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Text(
                      '${newsitem.desc ?? 'محتوى غير متوفر'}... مزيد من النص هنا',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 16,
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
