import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/now_playing.dart';

class HomeController extends GetxController {
  var api = '${dotenv.env['API_URL']}';
  var nowPlaying = Rx<NowPlaying?>(null);
  var popularMovie = Rx<NowPlaying?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchNowPlaying();
    fetchPopular();
  }

  Future<void> fetchNowPlaying() async {
    var url = Uri.https(api, '${dotenv.env['URL_NOW_PLAYING']}');

    var headers = {
      'Authorization': '${dotenv.env['ACCESS_TOKEN']}',
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      nowPlaying.value = NowPlaying.fromJson(jsonResponse);
    } else {
      Get.snackbar("Error", "Fetch data failed.");
    }
  }

  Future<void> fetchPopular() async {
    var url = Uri.https(api, '${dotenv.env['URL_POPULAR']}');

    var headers = {
      'Authorization': '${dotenv.env['ACCESS_TOKEN']}',
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      popularMovie.value = NowPlaying.fromJson(jsonResponse);
    } else {
      Get.snackbar("Error", "Fetch data failed.");
    }
  }
}
