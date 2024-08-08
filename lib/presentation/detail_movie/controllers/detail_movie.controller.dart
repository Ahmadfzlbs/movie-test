import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tes_kerja/models/detail_movie.dart';
import 'package:tes_kerja/models/similar_movie.dart';

class DetailMovieController extends GetxController {
  var api = 'api.themoviedb.org';
  var detailMovie = Rx<DetailMovie?>(null);
  var similarMovie = Rx<SimilarMovie?>(null);

  Future<void> fetchDetailMovie(String id) async {
    var url = Uri.https(api, '/3/movie/$id');

    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZTMzNGEyMTkyODhjYTBhMThkNGI1NjdiMjk3ZWQ3YyIsIm5iZiI6MTcyMzAxNTQ4NC43NDA0MTcsInN1YiI6IjY2YjJmN2NiNWQzZWY0ZDY2OGFhZTBiZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.EK4_rbvgz6yqY3K2bwsOzXm7wDb5SCVYiHyVpZIayiM',
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      detailMovie.value = DetailMovie.fromJson(jsonResponse);
    } else {
      Get.snackbar("Error", "Failed to fetch data");
    }
  }

  Future<void> fetchSimilarMovie(String id) async {
    var url = Uri.https(api, '3/movie/$id/similar');

    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZTMzNGEyMTkyODhjYTBhMThkNGI1NjdiMjk3ZWQ3YyIsIm5iZiI6MTcyMzAxNTQ4NC43NDA0MTcsInN1YiI6IjY2YjJmN2NiNWQzZWY0ZDY2OGFhZTBiZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.EK4_rbvgz6yqY3K2bwsOzXm7wDb5SCVYiHyVpZIayiM',
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      similarMovie.value = SimilarMovie.fromJson(jsonResponse);
    } else {
      Get.snackbar("Error", "Failed to fetch data");
    }
  }
}
