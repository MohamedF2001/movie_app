import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_movie_app/const/const.dart';
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
          //backgroundColor: Colors.cyan,
          /* appBar: AppBar(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
          ),*/
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
                        padding: const EdgeInsets.all(0),
                        child: Stack(children: [
                          Container(
                            height: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30)),
                              //color: Colors.amber,
                              image: DecorationImage(
                                image: NetworkImage(
                                    '$baseimg${viewModel.fetchedMovieDetails!.backdropPath}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 30.0,
                            left: 10.0,
                            child: IconButton(
                              icon: Icon(Icons.arrow_back,size: 30,weight: 30,),
                              onPressed: () {
                                // Action à effectuer lors du clic sur le bouton de retour
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // titre du film
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          viewModel.fetchedMovieDetails.title,
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // liste des genres du film
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 70.0,
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
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Text(
                                      genre.name,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  )),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // info complémentaires
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          /*Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Image.asset("assets/images/vote.png",width: helper.kIconSize,height: helper.kIconSize,color: Colors.white,),
                            SizedBox(width: 10,),
                            Text(
                                viewModel.fetchedMovieDetails.voteAverage
                                    .toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: helper.kDefautSize,
                                ))
                          ],
                        ),
                      ),
                    ),*/
                          SizedBox(width: 10),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/nvote.png",
                                    width: helper.kIconSize,
                                    height: helper.kIconSize,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                      viewModel.fetchedMovieDetails.voteCount
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: helper.kDefautSize))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/langue.png",
                                    width: helper.kIconSize,
                                    height: helper.kIconSize,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                      viewModel
                                          .fetchedMovieDetails.originalLanguage,
                                      style: TextStyle(
                                          fontSize: helper.kDefautSize))
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
                              Row(
                                children: [
                                  RatingBar.builder(
                                    glowRadius: 1,
                                    itemSize: 20,
                                    initialRating: viewModel
                                        .fetchedMovieDetails.voteAverage,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 10,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      //print(rating);
                                    },
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                      viewModel.fetchedMovieDetails.voteAverage
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: helper.kDefautSize,
                                      ))
                                ],
                              ),
                              //Text('Contenu en dessous du ListView horizontal'),

                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  viewModel.fetchedMovieDetails.tagline,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                viewModel.fetchedMovieDetails.overview,
                                style: TextStyle(
                                    height: 1.5,
                                    fontSize: helper.kDefautSize,
                                    ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/calendrier.png",
                                        width: helper.kIconSize,
                                        height: helper.kIconSize,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                          viewModel
                                              .fetchedMovieDetails.releaseDate,
                                          style: TextStyle(
                                              fontSize: helper.kDefautSize,
                                              )),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/euro.png",
                                        width: helper.kIconSize,
                                        height: helper.kIconSize,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        viewModel.fetchedMovieDetails.budget
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: helper.kDefautSize,
                                            ),
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
                                      Image.asset(
                                        "assets/images/popularite.png",
                                        width: helper.kIconSize,
                                        height: helper.kIconSize,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                          viewModel
                                              .fetchedMovieDetails.popularity
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: helper.kDefautSize,
                                              )),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/revenu.png",
                                        width: helper.kIconSize,
                                        height: helper.kIconSize,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                          viewModel.fetchedMovieDetails.revenue
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: helper.kDefautSize,
                                              )),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      /// Les acteurs du film
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Acteur",
                            style: TextStyle(
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
                        height: 280.0,
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
                                          backgroundColor: Colors.black,
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
                                              fontSize: 18),
                                        ),
                                        Text("dans le role de "),
                                        SizedBox(height: 5,),
                                        Text(actor.character),
                                      ],
                                    ),
                                  );
                                },
                              ),
                      ),
                      SizedBox(height: 30,)
                    ],
                  ),
                ),
        ),
      ]),
      viewModelBuilder: () => DetailMovieViewModel(start: start),
    );
  }
}
