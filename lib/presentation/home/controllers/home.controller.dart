import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/now_playing.dart';

class HomeController extends GetxController {
  final api = dotenv.env['API_URL'];
  final nowPlaying = Rx<NowPlaying?>(null);
  final popularMovie = Rx<NowPlaying?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchNowPlaying();
    fetchPopular();
  }

  Future<void> fetchNowPlaying() async {
    try {
      if (api == null || dotenv.env['URL_NOW_PLAYING'] == null) {
        Get.snackbar("Error", "API URL or endpoint is not set.");
        return;
      }

      var url = Uri.https(api!, dotenv.env['URL_NOW_PLAYING']!);

      var headers = {
        'Authorization': '${dotenv.env['ACCESS_TOKEN']}',
      };

      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        nowPlaying.value = NowPlaying.fromJson(jsonResponse);
      } else {
        Get.snackbar("Error",
            "Failed to fetch now playing movies. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    }
  }

  Future<void> fetchPopular() async {
    try {
      if (api == null ||
          dotenv.env['URL_POPULAR'] == null ||
          dotenv.env['ACCESS_TOKEN'] == null) {
        Get.snackbar("Error", "API URL, endpoint, or access token is not set.");
        return;
      }

      var url = Uri.https(api!, dotenv.env['URL_POPULAR']!);

      var headers = {
        'Authorization': '${dotenv.env['ACCESS_TOKEN']}',
      };

      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        popularMovie.value = NowPlaying.fromJson(jsonResponse);
      } else {
        Get.snackbar("Error",
            "Failed to fetch popular movies. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    }
  }
}
