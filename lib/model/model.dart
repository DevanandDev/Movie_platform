class MovieModel {
  final int id;
  final String title;
  final String? overview;
  final String? posterPath;
  final String? backdropPath;
  final String? releaseDate;
  final dynamic voteAverage;
  final int voteCount;
  final String originalLanguage;

  MovieModel({
    required this.id,
    required this.title,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.originalLanguage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json["id"],
      title: json["title"] ?? "",
      overview: json["overview"] ?? "",
      posterPath: json["poster_path"],
      backdropPath: json["backdrop_path"],
      releaseDate: json["release_date"],
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
      originalLanguage: json["original_language"],
    );
  }
}
