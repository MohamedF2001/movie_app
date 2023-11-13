import 'package:json_annotation/json_annotation.dart';

import 'actor.dart';
part 'credit.g.dart';

@JsonSerializable()
class Credit {
  List<Actor> cast;

  Credit({
    required this.cast,
  });

  factory Credit.fromJson(Map<String, dynamic> json) => _$CreditFromJson(json);

  Map<String, dynamic> toJson() => _$CreditToJson(this);
}
