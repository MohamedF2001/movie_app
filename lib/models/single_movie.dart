import 'package:json_annotation/json_annotation.dart';
import 'package:my_movie_app/models/production_company.dart';
import 'package:my_movie_app/models/production_country.dart';
import 'package:my_movie_app/models/spoken_language.dart';

import 'genre.dart';
import 'genre_list.dart';

part 'single_movie.g.dart';

@JsonSerializable()
class SingleMovie {
  @JsonKey(name: "adult")
  bool adult;
  @JsonKey(name: "backdrop_path")
  String backdropPath;
  @JsonKey(name: "belongs_to_collection")
  dynamic belongsToCollection;
  @JsonKey(name: "budget")
  int budget;
  @JsonKey(name: "genres")
  List<Genre> genres;
  @JsonKey(name: "homepage")
  String homepage;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "imdb_id")
  String imdbId;
  @JsonKey(name: "original_language")
  String originalLanguage;
  @JsonKey(name: "original_title")
  String originalTitle;
  @JsonKey(name: "overview")
  String overview;
  @JsonKey(name: "popularity")
  double popularity;
  @JsonKey(name: "poster_path")
  String posterPath;
  @JsonKey(name: "production_companies")
  List<ProductionCompany> productionCompanies;
  @JsonKey(name: "production_countries")
  List<ProductionCountry> productionCountries;
  @JsonKey(name: "release_date")
  String releaseDate;
  @JsonKey(name: "revenue")
  int revenue;
  @JsonKey(name: "runtime")
  int runtime;
  @JsonKey(name: "spoken_languages")
  List<SpokenLanguage> spokenLanguages;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "tagline")
  String tagline;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "video")
  bool video;
  @JsonKey(name: "vote_average")
  double voteAverage;
  @JsonKey(name: "vote_count")
  int voteCount;

  SingleMovie({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory SingleMovie.fromJson(Map<String, dynamic> json) =>
      _$SingleMovieFromJson(json);

  Map<String, dynamic> toJson() => _$SingleMovieToJson(this);
}
