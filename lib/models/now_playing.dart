class NowPlaying {
  int page;
  List<Result> results;

  NowPlaying({
    required this.page,
    required this.results,
  });

  factory NowPlaying.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<Result> resultList = list.map((i) => Result.fromJson(i)).toList();

    return NowPlaying(
      page: json['page'],
      results: resultList,
    );
  }
}

class Result {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Result({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  // Method to parse JSON to Result object
  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids']),
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'].toDouble(),
      posterPath: json['poster_path'],
      releaseDate: json['release_date'] != null ? DateTime.parse(json['release_date']) : null,
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average']?.toDouble(),
      voteCount: json['vote_count'],
    );
  }
}
