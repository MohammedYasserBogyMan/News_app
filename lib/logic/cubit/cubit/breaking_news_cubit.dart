import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:news_app_new_training/data/Api/api.dart';
import 'package:news_app_new_training/data/Models/news_model.dart';

part 'breaking_news_state.dart';

class BreakingNewsCubit extends Cubit<BreakingNewsState> {
  BreakingNewsCubit() : super(BreakingNewsInitial());

  Future<void> getBreakingNews() async {
    emit(BreakingNewsLoading());
    try {
      final breakingNews = await NewsServices().getBreakingNews();
      emit(BreakingNewsLoaded(breakingNews));
    } catch (e) {
      emit(BreakingNewsError(e.toString()));
    }
  }
}
