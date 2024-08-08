import 'package:flutter/material.dart';

class NowPlayingWidget extends StatelessWidget {
  final List movies;
  final String imageBaseUrl;
  final Function(String) onTap;

  const NowPlayingWidget({
    super.key,
    required this.movies,
    required this.imageBaseUrl,
    required this.onTap,
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Now Playing",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "See All",
                style: TextStyle(color: Colors.orange),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 420,
          child: ListView.builder(
            itemCount:
                movies.length > maxItemCount ? maxItemCount : movies.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                onTap: () => onTap(movies[index].id.toString()),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.white,
                        height: 350,
                        width: 200,
                        child: Image.network(
                          '$imageBaseUrl${movies[index].posterPath}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 150,
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          movies[index].title.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
