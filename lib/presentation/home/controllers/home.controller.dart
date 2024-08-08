import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
<<<<<<< HEAD
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tes_kerja/models/now_playing.dart';
=======
import 'package:movie_app/models/now_playing.dart';
>>>>>>> c5c92f6cb06e1f9bbe98e58a6e051da98f1e5c85

class HomeController extends GetxController {
  var api = '${dotenv.env['API_URL']}';
  var nowPlaying = Rx<NowPlaying?>(null);
  var popularMovie = Rx<NowPlaying?>(null);

  @override
  void onInit() {
    super.onInit();
    loadDataFromLocalStorage();
    fetchNowPlaying();
    fetchPopular();
  }

  Future<void> fetchNowPlaying() async {
<<<<<<< HEAD
    var url = Uri.https(api, '/3/movie/now_playing');
=======
    var url = Uri.https(api, '${dotenv.env['URL_NOW_PLAYING']}');

>>>>>>> c5c92f6cb06e1f9bbe98e58a6e051da98f1e5c85
    var headers = {
      'Authorization': '${dotenv.env['ACCESS_TOKEN']}',
    };

<<<<<<< HEAD
    try {
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        nowPlaying.value = NowPlaying.fromJson(jsonResponse);
        saveDataToLocalStorage('nowPlaying', jsonResponse);
      } else {
        Get.snackbar("Error", "Failed to fetch data");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
=======
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      nowPlaying.value = NowPlaying.fromJson(jsonResponse);
    } else {
      Get.snackbar("Error", "Fetch data failed.");
>>>>>>> c5c92f6cb06e1f9bbe98e58a6e051da98f1e5c85
    }
  }

  Future<void> fetchPopular() async {
<<<<<<< HEAD
    var url = Uri.https(api, '/3/movie/popular');
=======
    var url = Uri.https(api, '${dotenv.env['URL_POPULAR']}');

>>>>>>> c5c92f6cb06e1f9bbe98e58a6e051da98f1e5c85
    var headers = {
      'Authorization': '${dotenv.env['ACCESS_TOKEN']}',
    };

    try {
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        popularMovie.value = NowPlaying.fromJson(jsonResponse);
        saveDataToLocalStorage('popularMovie', jsonResponse);
      } else {
        Get.snackbar("Error", "Failed to fetch data");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    }
  }

<<<<<<< HEAD
  Future<void> saveDataToLocalStorage(
      String key, Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, jsonEncode(data));
  }

  Future<void> loadDataFromLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final nowPlayingData = prefs.getString('nowPlaying');
    final popularMovieData = prefs.getString('popularMovie');

    if (nowPlayingData != null) {
      nowPlaying.value = NowPlaying.fromJson(jsonDecode(nowPlayingData));
    }

    if (popularMovieData != null) {
      popularMovie.value = NowPlaying.fromJson(jsonDecode(popularMovieData));
=======
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      popularMovie.value = NowPlaying.fromJson(jsonResponse);
    } else {
      Get.snackbar("Error", "Fetch data failed.");
>>>>>>> c5c92f6cb06e1f9bbe98e58a6e051da98f1e5c85
    }
  }
}
