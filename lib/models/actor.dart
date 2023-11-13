import 'package:json_annotation/json_annotation.dart';
part 'actor.g.dart';

@JsonSerializable()
class Actor {
  @JsonKey(name: "adult")
  bool adult;
  @JsonKey(name: "gender")
  int gender;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "known_for_department")
  String knownForDepartment;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "original_name")
  String originalName;
  @JsonKey(name: "popularity")
  double popularity;
  @JsonKey(name: "profile_path")
  String profilePath;
  @JsonKey(name: "cast_id")
  int castId;
  @JsonKey(name: "character")
  String character;
  @JsonKey(name: "credit_id")
  String creditId;
  @JsonKey(name: "order")
  int order;

  Actor({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  });

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);

  Map<String, dynamic> toJson() => _$ActorToJson(this);
}
