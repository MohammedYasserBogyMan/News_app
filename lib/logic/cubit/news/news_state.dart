part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsLoaded extends NewsState {
  final List<NewsModel> news;

  NewsLoaded({required this.news});
}

final class NewsError extends NewsState {
  final String errMessage;

  NewsError({required this.errMessage});
}
