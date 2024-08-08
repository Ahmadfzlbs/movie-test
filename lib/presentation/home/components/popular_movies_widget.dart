import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';

class PopularWidget extends StatelessWidget {
  final List<dynamic> movies;
  final String imageBaseUrl;
  final Function(String) onTap;

  const PopularWidget(
      {super.key,
      required this.movies,
      required this.imageBaseUrl,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    const int maxItemCount = 20;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Popular",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
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
          height: 300,
          child: ListView.builder(
            itemCount:
                movies.length > maxItemCount ? maxItemCount : movies.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => onTap(movies[index].id.toString()),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: whiteColor,
                        height: 250,
                        width: 150,
                        child: Image.network(
                          '$imageBaseUrl${movies[index].posterPath}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 150,
                    child: Text(
                      movies[index].title.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
