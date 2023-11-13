import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        viewModelBuilder: () => SplashViewModel(),
        onViewModelReady: (viewModel) => viewModel.runMovieLogic(),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Colors.white12,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/loop.gif",
                      //width: 50,
                      //height: 50,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
