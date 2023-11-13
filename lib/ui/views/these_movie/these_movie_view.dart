import 'package:flutter/material.dart';
import 'package:my_movie_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../models/movie.dart';
import 'these_movie_viewmodel.dart';

class TheseMovieView extends StatelessWidget {
  const TheseMovieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationService = locator<NavigationService>();
    return ViewModelBuilder<TheseMovieViewModel>.reactive(
        viewModelBuilder: () => TheseMovieViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            //backgroundColor: Colors.white12,
            appBar: AppBar(
              backgroundColor: Colors.grey.shade600,
              centerTitle: true,
              title: const Text(
                "THE MOVIE",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Now Playing
                    const Text(
                      "Now Playing",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 400.0,
                      width: double.infinity,
                      child: viewModel.fetchingNowMovie
                          ? const Text(
                        "....",
                        style: TextStyle(color: Colors.white),
                      )
                          : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: viewModel.fetchedNowMovie.length,
                        itemBuilder: (context, index) {
                          Movie movie = viewModel.fetchedNowMovie[index];
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: GestureDetector(
                              onTap: () {
                                navigationService.navigateToDetailMovieView(
                                  start: movie.id!
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: viewModel.fetchingNowMovie
                                    ? const CircularProgressIndicator()
                                    : movie != null
                                    ? Image.network(
                                  'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                )
                                    : const Text(
                                    "Aucune donnée disponible"),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    /// Now Playing
                    const SizedBox(height: 20),
                    /*
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Popular",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 300.0,
                      child: viewModel.fetchingPopularMovie
                          ? const Text(
                              "....",
                              style: TextStyle(color: Colors.white),
                            )
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: viewModel.fetchedPopularMovie.length,
                              itemBuilder: (context, index) {
                                Movie moviepop =
                                    viewModel.fetchedNowMovie[index];
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: GestureDetector(
                                    onTap: () {
                                      //navigationService.navigateToMoreInfoView(
                                      //    start: movie.id!);
                                      navigationService
                                          .navigateToMultipleFuturesExampleView(
                                              start: moviepop.id!);
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: viewModel.fetchingPopularMovie
                                          ? const CircularProgressIndicator()
                                          : moviepop != null
                                              ? Image.network(
                                                  'https://image.tmdb.org/t/p/w500${moviepop.posterPath}',
                                                  height: 200)
                                              : const Text(
                                                  "Aucune donnée disponible"),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                    const SizedBox(height: 20),
                     */

                    /// Top rated
                    const Text(
                      "Top Rated",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 400.0,
                      child: viewModel.fetchingTopRatedMovie
                          ? const Text(
                        "....",
                        style: TextStyle(color: Colors.white),
                      )
                          : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: viewModel.fetchedTopRatedMovie.length,
                        itemBuilder: (context, index) {
                          Movie movieTop =
                          viewModel.fetchedTopRatedMovie[index];
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: GestureDetector(
                              onTap: () {
                                //navigationService.navigateToMoreInfoView(
                                //    start: movie.id!);
                                navigationService
                                    .navigateToDetailMovieView(
                                    start: movieTop.id!);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: viewModel.fetchingTopRatedMovie
                                    ? const CircularProgressIndicator()
                                    : movieTop != null
                                    ? Image.network(
                                    'https://image.tmdb.org/t/p/w500${movieTop.posterPath}',
                                    height: 200)
                                    : const Text(
                                    "Aucune donnée disponible"),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    /// Top rated
                    const SizedBox(height: 20),

                    /// Up Comming
                    const Text(
                      "Up Coming",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 400.0,
                      child: viewModel.fetchingUpComingMovie
                          ? const Text(
                        "....",
                        style: TextStyle(color: Colors.white),
                      )
                          : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: viewModel.fetchedUpComingMovie.length,
                        itemBuilder: (context, index) {
                          Movie movieUp =
                          viewModel.fetchedUpComingMovie[index];
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: GestureDetector(
                              onTap: () {
                                //navigationService.navigateToMoreInfoView(
                                //    start: movie.id!);
                                navigationService
                                    .navigateToDetailMovieView(
                                    start: movieUp.id!);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: viewModel.fetchingUpComingMovie
                                    ? const CircularProgressIndicator()
                                    : movieUp != null
                                    ? Image.network(
                                    'https://image.tmdb.org/t/p/w500${movieUp.posterPath}',
                                    height: 200)
                                    : const Text(
                                    "Aucune donnée disponible"),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
