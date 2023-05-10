//model class for data related to each of the movie details

class MovieModel {
  String? title;
  String? genre;
  List? director;
  List? stars;
  dynamic runtime;
  String? language;
  int? releaseDate;
  int? pageViews;
  int? totalVoted;
  List? upVoted;
  String? poster;

  MovieModel(
      {required this.director,
      required this.genre,
      required this.language,
      required this.pageViews,
      required this.poster,
      required this.releaseDate,
      required this.runtime,
      required this.stars,
      required this.title,
      required this.totalVoted,
      required this.upVoted});

  MovieModel.fromJson(Map data) {
    title = data['title'] ?? "";
    director = data['director'] ?? [];
    genre = data['genre'] ?? "";
    stars = data['stars'] ??[];
    runtime = data['runtime'];
    language = data['language']??"";
    releaseDate = data['releaseDate'] ?? 0;
    pageViews = data['pageViews'] ?? 0;
    totalVoted = data['totalVoted'] ?? 0;
    upVoted = data['upVoted'] ?? [];
    poster = data['poster'] ?? "";
  }
  
}
