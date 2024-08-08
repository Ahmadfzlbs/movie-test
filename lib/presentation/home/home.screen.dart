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
        if (controller.nowPlaying.value == null ||
            controller.popularMovie.value == null) {
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
                  Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            color: blueColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset("assets/images/movie.png"),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("Movies")
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            color: redColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset("assets/images/popcorn.png"),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("Food")
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            color: yellowColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset("assets/images/ticket.png"),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("Ticket")
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            color: purpleColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset("assets/images/chair.png"),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("Booking")
                    ],
                  ),
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
}
