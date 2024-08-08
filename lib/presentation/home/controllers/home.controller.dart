import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:movie_app/models/now_playing.dart';

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
    var url = Uri.https(api, '${dotenv.env['URL_NOW_PLAYING']}');
    var headers = {
      'Authorization': '${dotenv.env['ACCESS_TOKEN']}',
    };

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
    }
  }

  Future<void> fetchPopular() async {
    var url = Uri.https(api, '${dotenv.env['URL_POPULAR']}');
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
    }
  }
}
