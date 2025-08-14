part of 'breaking_news_cubit.dart';

@immutable
sealed class BreakingNewsState {}

final class BreakingNewsInitial extends BreakingNewsState {}

final class BreakingNewsLoading extends BreakingNewsState {}

final class BreakingNewsLoaded extends BreakingNewsState {
  final List<NewsModel> breakingNews;

  BreakingNewsLoaded(this.breakingNews);
}

final class BreakingNewsError extends BreakingNewsState {
  final String error;

  BreakingNewsError(this.error);
}
