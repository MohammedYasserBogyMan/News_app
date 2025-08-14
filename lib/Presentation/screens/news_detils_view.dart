import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_new_training/Presentation/widgets/draggabel_scroll_sheet.dart';
import 'package:news_app_new_training/Presentation/widgets/news_image_text_shado.dart';
import 'package:news_app_new_training/data/Models/bookmark_model.dart';
import 'package:news_app_new_training/data/Models/news_model.dart';
import 'package:news_app_new_training/logic/cubit/bookmars/book_mark_cubit.dart';

class NewsDetilsView extends StatefulWidget {
  const NewsDetilsView({super.key, required this.newsitem});
  final NewsModel newsitem;

  @override
  State<NewsDetilsView> createState() => _NewsDetilsViewState();
}

class _NewsDetilsViewState extends State<NewsDetilsView> {
  bool isBookmarked = false;

  @override
  void initState() {
    super.initState();
    isBookmarked = BlocProvider.of<BookmarkCubit>(context)
        .isBookmarked(widget.newsitem.titel ?? '');
  }

  void toggleBookmark() {
    final bookmark = Bookmark(
      image: widget.newsitem.image,
      desc: widget.newsitem.desc ?? '',
      title: widget.newsitem.titel ?? 'لا يوجد عنوان للخبر',
    );

    if (isBookmarked) {
      BlocProvider.of<BookmarkCubit>(context).removeBookmark(bookmark);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Directionality(
            textDirection: TextDirection.rtl,
            child: Text('تم حذف الخبر من المحفوظات'),
          ),
        ),
      );
    } else {
      BlocProvider.of<BookmarkCubit>(context).addBookmark(bookmark);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.blue,
          content: Directionality(
            textDirection: TextDirection.rtl,
            child: Text('تم إضافة الخبر إلى المحفوظات'),
          ),
        ),
      );
    }

    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 450,
            child: Stack(
              children: [
                Image.network(
                  widget.newsitem.image ?? '',
                  height: 500,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 120,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Transform(
                    transform: Matrix4.identity()..scale(1.0, -1.0),
                    child: const newsTextImageShado(),
                  ),
                ),
                const Positioned(
                  top: 230,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: newsTextImageShado(),
                ),
                Positioned(
                  width: MediaQuery.of(context).size.width - 30,
                  bottom: 40,
                  right: 20,
                  child: Text(
                    widget.newsitem.titel ?? 'عنوان غير متوفر',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    maxLines: 2,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: Colors.white,
                  ),
                  onPressed: toggleBookmark,
                ),
              ],
            ),
          ),
          DraggableSheetScroll(newsitem: widget.newsitem),
        ],
      ),
    );
  }
}
