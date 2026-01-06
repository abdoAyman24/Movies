import 'package:flutter/material.dart';
import 'package:movies/core/widget/custom_cach_network_image.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';
import 'package:movies/feature/home/presentation/view/widget/movie_detailes.dart';

class MoviesListView extends StatelessWidget {
  const MoviesListView({super.key, required this.movies});
  final List<MovieEntity> movies;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return AspectRatio(
          aspectRatio: 0.7,
          child: Padding(
            padding: const EdgeInsets.only(right: 25),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MovieDetailes.routeName,
                  arguments:movies[index],
                );
              },
              child: CustomCachNetworkImage(imageUrl: movies[index].posterPath),
            ),
          ),
        );
      },
    );
  }
}
