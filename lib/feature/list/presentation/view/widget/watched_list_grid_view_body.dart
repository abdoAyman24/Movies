import 'package:flutter/material.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';
import 'package:movies/feature/home/presentation/view/widget/movies_view_item.dart';

class WatchedListGridViewBody extends StatelessWidget {
  const WatchedListGridViewBody({
    super.key,
    this.movieFilter = const [],
    required this.movies,
  });

  final List<MovieEntity> movieFilter;
  final List<MovieEntity> movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              childAspectRatio: 0.51,
              mainAxisSpacing: 15,
            ),
            itemCount: movieFilter.isNotEmpty
                ? movieFilter.length
                : movies.length,
            itemBuilder: (context, index) {
              return MoviesViewItem(
                movie: movieFilter.isNotEmpty
                    ? movieFilter[index]
                    : movies[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
