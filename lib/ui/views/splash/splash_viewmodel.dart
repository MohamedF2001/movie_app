import 'package:my_movie_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class SplashViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // Place anything here that needs to happen before we get into the application
  Future runMovieLogic() async {
    await Future.delayed(const Duration(seconds: 6));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic


    _navigationService.replaceWithTheseMovieView();
  }
}
