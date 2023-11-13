import 'package:stacked/stacked.dart';

import '../../../function/functions.dart';
import '../../../main.dart';
import '../../../models/movie.dart';

const String _NowMovieFuture = 'nowMovie';
const String _PopularMovieFuture = 'popularMovie';
const String _TopRatedMovieFuture = 'topRatedMovie';
const String _UpComingMovieFuture = 'upComingMovie';

///const String _MovieGenre = 'movieGenre';
class TheseMovieViewModel extends MultipleFutureViewModel {
  List<Movie> get fetchedNowMovie => dataMap?[_NowMovieFuture];

  bool get fetchingNowMovie => busy(_NowMovieFuture);

  List<Movie> get fetchedPopularMovie => dataMap?[_PopularMovieFuture];

  bool get fetchingPopularMovie => busy(_PopularMovieFuture);

  List<Movie> get fetchedTopRatedMovie => dataMap?[_TopRatedMovieFuture];

  bool get fetchingTopRatedMovie => busy(_TopRatedMovieFuture);

  List<Movie> get fetchedUpComingMovie => dataMap?[_UpComingMovieFuture];

  bool get fetchingUpComingMovie => busy(_UpComingMovieFuture);

  @override
  Map<String, Future Function()> get futuresMap => {
    _NowMovieFuture: getNowMovieDelay,
    _PopularMovieFuture: getPopularMovieDelay,
    _TopRatedMovieFuture: getTopRatedMovieDelay,
    _UpComingMovieFuture: getUpComingMovieDelay,
  };

  Future<List<Movie>> getNowMovieDelay() async {
    await Future.delayed(Duration(seconds: 3));
    final listMovie = await Utils.client.getNowPlayingMovies(theapiKey);
    print(listMovie.results);
    return listMovie.results;
  }

  Future<List<Movie>> getPopularMovieDelay() async {
    final popularMovie = await Utils.client.getPopularMovies(theapiKey);
    print(popularMovie.results);
    return popularMovie.results;
  }

  Future<List<Movie>> getTopRatedMovieDelay() async {
    final topRatedMovie = await Utils.client.getTopRatedMovies(theapiKey);
    print(topRatedMovie.results);
    return topRatedMovie.results;
  }

  Future<List<Movie>> getUpComingMovieDelay() async {
    final upComingMovie = await Utils.client.getUpComingMovies(theapiKey);
    print(upComingMovie.results);
    return upComingMovie.results;
  }
}

