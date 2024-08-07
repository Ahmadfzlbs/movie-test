import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart'; // Pastikan ini termasuk imageBaseUrl
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
        if (controller.nowPlaying.value == null) {
          return const Center(child: CircularProgressIndicator());
        }

        var nowPlayingMovies = controller.nowPlaying.value!.results;
        var popularMovies = controller.popularMovie.value!.results;
        const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
        const int maxItemCount = 20;

        return ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Now Playing",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "See All",
                    style: TextStyle(color: orangeColor),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: nowPlayingMovies.length > maxItemCount
                    ? maxItemCount
                    : nowPlayingMovies.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: whiteColor,
                          height: 150,
                          width: 100,
                          child: Image.network(
                            '$imageBaseUrl${nowPlayingMovies[index].posterPath}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          nowPlayingMovies[index].title.toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Popular",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    controller.fetchPopular();
                  },
                  child: const Text(
                    "See All",
                    style: TextStyle(color: orangeColor),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: popularMovies.length > maxItemCount
                    ? maxItemCount
                    : popularMovies.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: whiteColor,
                          height: 150,
                          width: 100,
                          child: Image.network(
                            '$imageBaseUrl${popularMovies[index].posterPath}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          popularMovies[index].title.toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
