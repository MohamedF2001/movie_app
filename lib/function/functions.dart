import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../api/movie_api.dart';
import '../main.dart';

class Utils {
  static Logger log = Logger();
  static final client = RestClient(
    Dio(
      BaseOptions(
          contentType: "application/json",
          headers: {'Authorization': 'Bearer $leToken'}),
    ),
  );
}
