import 'package:equatable/equatable.dart';

Map<int, String> genreMap = {
  10759: "Action & Adventure",
  16: "Animazione",
  35: "Commedia",
  37: "Western",
  80: "Crime",
  99: "Documentario",
  18: "Dramma",
  10751: "Famiglia",
  10762: "Kids",
  9648: "Mistero",
  10763: "News",
  10764: "Reality",
  10765: "Sci-fi & Fantasy",
  10766: "Soap",
  10767: "Talk",
  10768: "War & Politics",
};

class Movie extends Equatable {
  final int id;
  final int voteCount;

  final double voteAverage;
  final double popularity;

  final bool adult;
  final bool video;

  final String posterPath;


  final String backdropPath;
  final String originalLanguage;
  final String originalTitle;
  final String title;
  final String overview;

  final DateTime releaseDate;

  final List<String> genres;

  const Movie({this.id,
    this.voteCount,
    this.voteAverage,
    this.popularity,
    this.adult,
    this.video,
    this.posterPath,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.title,
    this.overview,
    this.genres,
    this.releaseDate});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int,
      voteCount: json['vote_count'] as int,
      popularity: json['popularity'] as double,
      voteAverage: json['vote_average'].toDouble(),
      adult: json['adult'] as bool,
      video: json['video'] as bool,
      posterPath: json['poster_path'] as String,
      backdropPath: json['backdropPath'] as String,
      originalLanguage: json['origina_language'] as String,
      originalTitle: json['original_title'] as String,
      title: json['title'] as String,
      overview: json['overview'] as String,
      genres: json['genre_ids'].map<String>((id) => genreMap[id]).toList(),
      releaseDate: DateTime.parse(json['release_date']),
    );
  }

  @override
  List<Object> get props =>
    [
      id,
      voteCount,
      popularity,
      voteAverage,
      adult,
      video,
      backdropPath,
      originalLanguage,
      originalTitle,
      title,
      overview,
      releaseDate
    ];
}

