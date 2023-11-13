import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:stacked/stacked.dart';

import '../../../main.dart';
import '../../../models/actor.dart';
import '../../../models/genre.dart';
import 'detail_movie_viewmodel.dart';

class DetailMovieView extends StatelessWidget {
  const DetailMovieView({super.key, required this.start});

  final int start;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailMovieViewModel>.reactive(
      onViewModelReady: (model) =>
          model.getActorAfterDelay(start.toString(), theapiKey),
      builder: (context, viewModel, child) => Stack(children: [
        Container(
          color: Colors.black12,
        ),
        /*Image.network(
          '$baseimg${viewModel.fetchedMovieDetails.backdropPath}',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),*/
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
          ),
          body: viewModel.fetchingMovieDetails
          //&& viewModel.fetchingActor
              ? const Text(
            "....",
            style: TextStyle(color: Colors.white),
          )
              : SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      //color: Colors.amber,
                      image: DecorationImage(
                        image: NetworkImage(
                            '$baseimg${viewModel.fetchedMovieDetails!.posterPath}'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 80.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      //itemCount: model.singleMovie!.genres.length,
                      itemCount:
                      viewModel.fetchedMovieDetails.genres.length,
                      itemBuilder: (context, index) {
                        Genre genre =
                        viewModel.fetchedMovieDetails.genres[index];
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              //color: Colors.blue,
                                border: Border.all(
                                    color: Colors.white, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Text(
                                    genre.name,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                )),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            //Ikonate(Ikonate.controls_vertical_alt),
                            const Icon(
                              Icons.how_to_vote_outlined,
                              color: Colors.white,
                            ),
                            Text(
                                viewModel.fetchedMovieDetails.voteAverage
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.where_to_vote_outlined,
                              color: Colors.white,
                            ),
                            Text(
                                viewModel.fetchedMovieDetails.voteCount
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.language,
                              color: Colors.white,
                            ),
                            Text(
                                viewModel
                                    .fetchedMovieDetails.originalLanguage,
                                style: const TextStyle(
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  //height: 400.0,
                  //color: Colors.blue,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RatingBar.builder(
                          glowRadius: 1,
                          itemSize: 20,
                          initialRating:
                          viewModel.fetchedMovieDetails.voteAverage,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 10,
                          itemPadding:
                          const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            //print(rating);
                          },
                        ),
                        //Text('Contenu en dessous du ListView horizontal'),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            viewModel.fetchedMovieDetails.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            viewModel.fetchedMovieDetails.tagline,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          viewModel.fetchedMovieDetails.overview,
                          style: const TextStyle(
                              height: 1.2,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.date_range,
                                    color: Colors.white),
                                const SizedBox(width: 5),
                                Text(
                                    viewModel
                                        .fetchedMovieDetails.releaseDate,
                                    style: const TextStyle(
                                        color: Colors.white)),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.money,
                                    color: Colors.white),
                                const SizedBox(width: 5),
                                Text(
                                  viewModel.fetchedMovieDetails.budget
                                      .toString(),
                                  style: const TextStyle(
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.people_outline_outlined,
                                    color: Colors.white),
                                const SizedBox(width: 5),
                                Text(
                                    viewModel
                                        .fetchedMovieDetails.popularity
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.white)),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.monetization_on,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                    viewModel.fetchedMovieDetails.revenue
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.white)),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Acteur",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 210.0,
                  child: viewModel.fetchingActor
                      ? const Text(
                    "....",
                    style: TextStyle(color: Colors.white),
                  )
                      : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: viewModel.fetchedActor.length,
                    itemBuilder: (context, index) {
                      Actor actor = viewModel.fetchedActor[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white38,
                              radius: 80,
                              child: CircleAvatar(
                                radius: 77,
                                backgroundImage: NetworkImage(
                                    '$baseimg${actor.profilePath}'),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              actor.originalName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
      viewModelBuilder: () => DetailMovieViewModel(start: start),
    );
  }
}
