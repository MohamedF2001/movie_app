import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../models/credit.dart';
import '../models/genre.dart';
import '../models/genre_list.dart';
import '../models/movie_now.dart';
import '../models/single_movie.dart';

part 'movie_api.g.dart';

class Apis {
  static const String baseUrl = "https://api.themoviedb.org/3";

  static const String nowPlaying = "/movie/now_playing";
  static const String popular = "/movie/popular";
  static const String top_rated = "/movie/top_rated";
  static const String upcoming = "/movie/upcoming";
  static const String movieDetails = "/movie/{movie_id}";
  static const String genres = "/genre/movie/list";
  static const String casting = "/movie/{movie_id}/credits";
}

@RestApi(baseUrl: Apis.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  //@Headers({"Authorization: Bearer <Your_Token>"})
  @GET(Apis.nowPlaying)
  Future<MovieNow> getNowPlayingMovies(@Query("api_key") String apiKey);

  @GET(Apis.popular)
  Future<MovieNow> getPopularMovies(@Query("api_key") String apiKey);

  @GET(Apis.top_rated)
  Future<MovieNow> getTopRatedMovies(@Query("api_key") String apiKey);

  @GET(Apis.upcoming)
  Future<MovieNow> getUpComingMovies(@Query("api_key") String apiKey);

  @GET(Apis.movieDetails)
  Future<SingleMovie> getMovieDetails(
      @Path("movie_id") String id, @Query("api_key") String apiKey);

  @GET(Apis.genres)
  Future<GenreList> getGenre(@Query("api_key") String apiKay);

  @GET(Apis.casting)
  Future<Credit> getCasting(
      @Path("movie_id") String id, @Query("api_key") String apiKey);
}
