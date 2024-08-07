import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tes_kerja/models/now_playing.dart';

class HomeController extends GetxController {
  var api = 'api.themoviedb.org';
  var nowPlaying = Rx<NowPlaying?>(null);
  var popularMovie = Rx<NowPlaying?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchNowPlaying();
    fetchPopular();
  }

  Future<void> fetchNowPlaying() async {
    var url = Uri.https(api, '/3/movie/now_playing');

    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZTMzNGEyMTkyODhjYTBhMThkNGI1NjdiMjk3ZWQ3YyIsIm5iZiI6MTcyMzAxNTQ4NC43NDA0MTcsInN1YiI6IjY2YjJmN2NiNWQzZWY0ZDY2OGFhZTBiZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.EK4_rbvgz6yqY3K2bwsOzXm7wDb5SCVYiHyVpZIayiM',
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      nowPlaying.value = NowPlaying.fromJson(jsonResponse);
    } else {
      Get.snackbar("Error", "Failed fetch data");
    }
  }

  Future<void> fetchPopular() async {
    var url = Uri.https(api, '/3/movie/popular');

    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZTMzNGEyMTkyODhjYTBhMThkNGI1NjdiMjk3ZWQ3YyIsIm5iZiI6MTcyMzAxNTQ4NC43NDA0MTcsInN1YiI6IjY2YjJmN2NiNWQzZWY0ZDY2OGFhZTBiZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.EK4_rbvgz6yqY3K2bwsOzXm7wDb5SCVYiHyVpZIayiM',
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      popularMovie.value = NowPlaying.fromJson(jsonResponse);
    } else {
      Get.snackbar("Error", "Failed fetch data");
    }
  }
}
