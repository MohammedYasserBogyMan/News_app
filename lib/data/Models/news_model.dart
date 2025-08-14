class NewsModel {
  final String? image;
  final String? titel;
  final String? desc;
  final String? date;
  final String? contant;
  final String? author;
  final String? category;

  NewsModel(
      {required this.category,
      required this.contant,
      required this.author,
      required this.date,
      required this.image,
      required this.titel,
      required this.desc});
}
