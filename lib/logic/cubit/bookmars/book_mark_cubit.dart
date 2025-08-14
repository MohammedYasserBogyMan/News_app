import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:news_app_new_training/data/Models/bookmark_model.dart';

part 'book_mark_state.dart';

class BookmarkCubit extends Cubit<List<Bookmark>> {
  BookmarkCubit() : super([]);

  void addBookmark(Bookmark bookmark) {
    if (!isBookmarked(bookmark.title)) {
      final updatedBookmarks = List<Bookmark>.from(state);
      updatedBookmarks.add(bookmark);
      emit(updatedBookmarks);
    }
  }

  void removeBookmark(Bookmark bookmark) {
    final updatedBookmarks = List<Bookmark>.from(state);
    updatedBookmarks.removeWhere((item) => item.title == bookmark.title);
  }

  bool isBookmarked(String title) {
    return state.any((bookmark) => bookmark.title == title);
  }
}
