// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_now.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieNow _$MovieNowFromJson(Map<String, dynamic> json) => MovieNow(
      results: (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieNowToJson(MovieNow instance) => <String, dynamic>{
      'results': instance.results,
    };
