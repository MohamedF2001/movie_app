import 'package:json_annotation/json_annotation.dart';

import 'movie.dart';
part 'movie_now.g.dart';

@JsonSerializable()
class MovieNow {
  List<Movie> results;

  MovieNow({
    required this.results,
  });

  factory MovieNow.fromJson(Map<String, dynamic> json) =>
      _$MovieNowFromJson(json);

  Map<String, dynamic> toJson() => _$MovieNowToJson(this);
}
