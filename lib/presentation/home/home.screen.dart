import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes_kerja/presentation/home/components/now_playing_widget.dart';
import 'package:tes_kerja/presentation/home/components/popular_widget.dart';

import '../../constants.dart';
import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              color: whiteColor,
            ),
          ),
        ],
        backgroundColor: blackColor,
        title: const Text(
          'Home',
          style: TextStyle(color: whiteColor, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.nowPlaying.value == null ||
            controller.popularMovie.value == null) {
          return const Center(child: CircularProgressIndicator());
        }

        var nowPlayingMovies = controller.nowPlaying.value!.results;
        var popularMovies = controller.popularMovie.value!.results;
        const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

        return ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            NowPlayingWidget(
                movies: nowPlayingMovies, imageBaseUrl: imageBaseUrl),
            PopularWidget(
              movies: popularMovies,
              imageBaseUrl: imageBaseUrl,
            ),
          ],
        );
      }),
    );
  }
}
