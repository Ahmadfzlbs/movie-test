import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes_kerja/constants.dart';
import 'package:tes_kerja/infrastructure/navigation/routes.dart';
import 'package:tes_kerja/presentation/home/components/now_playing_movies_widget.dart';
import 'package:tes_kerja/presentation/home/components/popular_movies_widget.dart';
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
            ),
          ),
        ],
        backgroundColor: whiteColor,
        title: const Text(
          'e-Tix',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Obx(() {
        if (controller.nowPlaying.value == null || controller.popularMovie.value == null) {
          return const Center(child: CircularProgressIndicator());
        }

        var nowPlayingMovies = controller.nowPlaying.value!.results;
        var popularMovies = controller.popularMovie.value!.results;
        const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

        return ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryItem("Movies", "assets/images/movie.png", blueColor),
                  _buildCategoryItem("Food", "assets/images/popcorn.png", redColor),
                  _buildCategoryItem("Ticket", "assets/images/ticket.png", yellowColor),
                  _buildCategoryItem("Booking", "assets/images/chair.png", purpleColor),
                ],
              ),
            ),
            NowPlayingWidget(
              movies: nowPlayingMovies,
              imageBaseUrl: imageBaseUrl,
              onTap: (id) => Get.toNamed(Routes.DETAIL_MOVIE, arguments: id),
            ),
            PopularWidget(
              movies: popularMovies,
              imageBaseUrl: imageBaseUrl,
              onTap: (id) => Get.toNamed(Routes.DETAIL_MOVIE, arguments: id),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildCategoryItem(String title, String imagePath, Color color) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10)),
          child: Image.asset(imagePath),
        ),
        const SizedBox(height: 5),
        Text(title),
      ],
    );
  }
}
