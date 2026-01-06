import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/feature/favorite/presentation/manager/cubit/favorite_cubit.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';

class AddMovieToFavoriteWidget extends StatelessWidget {
  const AddMovieToFavoriteWidget({super.key, required this.movie});

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (context.read<FavoriteCubit>().favoriteMovie.isExist(movie)) {
          context.read<FavoriteCubit>().deleteFromFavorite(movie);
        } else {
          context.read<FavoriteCubit>().addMovieToFavorite(movie);
        }
      },
      child: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {
          if (state is SuccessAddMoviesToFavorite ||
              state is RemoveMovieFromFavorite) {
            log('feat favorite');
            context.read<FavoriteCubit>().featchFavoriteMovies();
          }
        },
        builder: (context, state) {
          if (state is FavoriteLoad ||
              state is SuccessAddMoviesToFavorite ||
              state is RemoveMovieFromFavorite) {
            return Center(child: CircularProgressIndicator());
          }
          return context.read<FavoriteCubit>().favoriteMovie.isExist(movie)
              ? Icon(Icons.favorite, color: Colors.red)
              : Icon(Icons.favorite);
        },
      ),
    );
  }
}
