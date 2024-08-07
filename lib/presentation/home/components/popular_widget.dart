import 'package:flutter/material.dart';
import 'package:tes_kerja/constants.dart';

class PopularWidget extends StatelessWidget {
  final List<dynamic> movies;
  final String imageBaseUrl;

  const PopularWidget({
    super.key,
    required this.movies,
    required this.imageBaseUrl,
  });

  @override
  Widget build(BuildContext context) {
    const int maxItemCount = 6;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Popular",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: (){},
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
            itemCount: movies.length > maxItemCount ? maxItemCount : movies.length,
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
                        '$imageBaseUrl${movies[index].posterPath}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 100,
                    child: Text(
                      movies[index].title.toString(),
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
  }
}
