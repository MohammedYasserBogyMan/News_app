import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:news_app_new_training/data/Api/api.dart';
import 'package:news_app_new_training/data/Models/news_model.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  Future<void> getNews() async {
    emit(NewsLoading());
    try {
      List<NewsModel> news =
          await NewsServices().getAllNews(); // استدعاء البيانات بشكل صحيح
      emit(NewsLoaded(news: news));
    } catch (e) {
      emit(NewsError(errMessage: e.toString())); // التعامل مع الأخطاء
    }
  }

//   Future<void> getBreakingNews() async {
//     emit(NewsLoading());
//     try {
//       List<NewsModel> breakingNews =
//           await NewsServices().getBreakingNews(); // استدعاء الأخبار العاجلة
//       emit(BreakingNewsLoaded(breakingNews)); // حالة جديدة للأخبار العاجلة
//     } catch (e) {
//       emit(NewsError(errMessage: e.toString()));
//     }
//   }
}
