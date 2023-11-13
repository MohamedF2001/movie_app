import 'package:stacked/stacked.dart';

import '../../../function/functions.dart';
import '../../../main.dart';
import '../../../models/actor.dart';
import '../../../models/genre_list.dart';
import '../../../models/single_movie.dart';

const String _ActorDelayFuture = 'movieActor';

const String _MovieDetailsFuture =
    'movieDetails'; // Nouvelle constante de chaîne
const String _MovieGenre = 'movieGenre';

class DetailMovieViewModel extends MultipleFutureViewModel {
  final int start;

  DetailMovieViewModel({required this.start});

  List<Actor> get fetchedActor => dataMap?[_ActorDelayFuture];

  bool get fetchingActor => busy(_ActorDelayFuture);

  SingleMovie get fetchedMovieDetails => dataMap?[_MovieDetailsFuture];

  bool get fetchingMovieDetails => busy(_MovieDetailsFuture);

  GenreList get fetchedGenre => dataMap?[_MovieGenre];

  bool get fetchingGenre => busy(_MovieGenre);

  @override
  Map<String, Future Function()> get futuresMap => {
    _ActorDelayFuture: () =>
        getActorAfterDelay(start.toString(), theapiKey),
    _MovieDetailsFuture: () => getDetailsDelay(
      start.toString(),
      theapiKey,
    ),
  };

  @override
  void onError({String? key, error}) {
    print('has error: $error for key: $key');
  }

  Future<List<Actor>> getActorAfterDelay(String movieId, String apiKey) async {
    await Future.delayed(Duration(seconds: 3));
    final credit = await Utils.client.getCasting(movieId, theapiKey);
    print(credit.cast);
    print("object");
    print(credit.cast.length);
    return credit.cast;
  }

  Future<SingleMovie> getDetailsDelay(String movieId, String apiKey) async {
    final movieDetails = await Utils.client.getMovieDetails(movieId, theapiKey);
    print(movieDetails.id);
    print(movieDetails.originalTitle);
    //return "Movie details received: $movieDetails";
    return SingleMovie(
        adult: movieDetails.adult,
        backdropPath: movieDetails.backdropPath,
        belongsToCollection: movieDetails.belongsToCollection,
        budget: movieDetails.budget,
        genres: movieDetails.genres,
        homepage: movieDetails.homepage,
        id: movieDetails.id,
        imdbId: movieDetails.imdbId,
        originalLanguage: movieDetails.originalLanguage,
        originalTitle: movieDetails.originalTitle,
        overview: movieDetails.overview,
        popularity: movieDetails.popularity,
        posterPath: movieDetails.posterPath,
        productionCompanies: movieDetails.productionCompanies,
        productionCountries: movieDetails.productionCountries,
        releaseDate: movieDetails.releaseDate,
        revenue: movieDetails.revenue,
        runtime: movieDetails.runtime,
        spokenLanguages: movieDetails.spokenLanguages,
        status: movieDetails.status,
        tagline: movieDetails.tagline,
        title: movieDetails.title,
        video: movieDetails.video,
        voteAverage: movieDetails.voteAverage,
        voteCount: movieDetails.voteCount);
  }

  Future<GenreList> getGenre() async {
    final allgenre = await Utils.client.getGenre(theapiKey);
    print(allgenre.genres.length);
    print(allgenre.genres);
    return GenreList(genres: allgenre.genres);
  }
}
