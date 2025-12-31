import 'package:flutter/material.dart';
import 'package:movies/core/utils/app_color.dart';
import 'package:movies/core/widget/custom_back_ground.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';
import 'package:movies/feature/home/presentation/view/widget/movies_grid_view_body.dart';

class MoviesGridView extends StatefulWidget {
  const MoviesGridView({super.key, required this.movies});
  static const String routName = 'movies_grid_view';
  final List<MovieEntity> movies;

  @override
  State<MoviesGridView> createState() => _MoviesGridViewState();
}

class _MoviesGridViewState extends State<MoviesGridView> {
  List<MovieEntity> movieFilter = [];
  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isSearch ? moviesAppBarSearch() : moviesAppBar(),

      body: Stack(
        children: [
          CustomBackGround(),
          MoviesGridViewBody(movies: widget.movies, movieFilter: movieFilter),
        ],
      ),
    );
  }

  PreferredSizeWidget moviesAppBar() {
    return AppBar(
      backgroundColor: AppColor.primary,
      title: Text('Movies'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              isSearch = true;
            });
          },
          icon: Icon(Icons.search_outlined),
        ),
      ],
    );
  }

  PreferredSizeWidget moviesAppBarSearch() {
    return AppBar(
      backgroundColor: AppColor.primary,
      title: TextFormField(
        onChanged: (value) {
          setState(() {
            movieFilter = widget.movies
                .where((e) => e.title.toLowerCase().startsWith(value))
                .toList();
          });
        },

        decoration: InputDecoration(
          hintText: 'Search',
          fillColor: AppColor.primary,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              isSearch = false;
              movieFilter.clear();
            });
          },
          icon: Icon(Icons.clear),
        ),
      ],
    );
  }
}
