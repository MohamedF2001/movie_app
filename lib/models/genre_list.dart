import 'package:json_annotation/json_annotation.dart';

import 'genre.dart';
part 'genre_list.g.dart';

@JsonSerializable()
class GenreList {
  List<Genre> genres;

  GenreList({
    required this.genres,
  });

  factory GenreList.fromJson(Map<String, dynamic> json) =>
      _$GenreListFromJson(json);

  Map<String, dynamic> toJson() => _$GenreListToJson(this);
}
