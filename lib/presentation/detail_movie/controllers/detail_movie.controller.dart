import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/detail_movie.dart';
import 'package:movie_app/models/similar_movie.dart';

class DetailMovieController extends GetxController {
  var api = '${dotenv.env['API_URL']}';
  var detailMovie = Rx<DetailMovie?>(null);
  var similarMovie = Rx<SimilarMovie?>(null);

  Future<void> fetchDetailMovie(String id) async {
    var url = Uri.https(api, '/3/movie/$id');

    var headers = {
      'Authorization': '${dotenv.env['ACCESS_TOKEN']}',
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      detailMovie.value = DetailMovie.fromJson(jsonResponse);
    } else {
      Get.snackbar("Error", "Fetch data failed.");
    }
  }

  Future<void> fetchSimilarMovie(String id) async {
    var url = Uri.https(api, '3/movie/$id/similar');

    var headers = {
      'Authorization': '${dotenv.env['ACCESS_TOKEN']}',
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      similarMovie.value = SimilarMovie.fromJson(jsonResponse);
    } else {
      Get.snackbar("Error", "Fetch data failed.");
    }
  }
}
