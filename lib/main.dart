import 'package:flutter/material.dart';
import 'package:my_movie_app/app/app.bottomsheets.dart';
import 'package:my_movie_app/app/app.dialogs.dart';
import 'package:my_movie_app/app/app.locator.dart';
import 'package:my_movie_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

const baseImg = 'https://image.tmdb.org/t/p/w500';
const String leToken =
    "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwM2RjYTJlNWVlMWJjZWEzZDc0ZWI5YTYyNjRhYjdlYiIsInN1YiI6IjY1MDlhNmEzZmEyN2Y0MDEwYzRjMDIxYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CWHE0fPDQWP8akAQxe-92HC2JWTfPMtCo0TyPXVu3Qg";
const String baseimg = "https://image.tmdb.org/t/p/w500";
const String theapiKey = "03dca2e5ee1bcea3d74eb9a6264ab7eb";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //initialRoute: Routes.startupView,
      initialRoute: Routes.splashView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
