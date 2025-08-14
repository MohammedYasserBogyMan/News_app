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
      List<NewsModel> news = await NewsServices().getAllNews();
      emit(NewsLoaded(news: news));
    } catch (e) {
      emit(NewsError(errMessage: e.toString()));
    }
  }
}
