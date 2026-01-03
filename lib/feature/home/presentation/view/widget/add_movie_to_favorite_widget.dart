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
          context.read<FavoriteCubit>().deleteFromFavorite(movie.id.toInt());
          Future.delayed(Duration(seconds: 1), () {
            context.read<FavoriteCubit>().featchFavoriteMovies();
          });
        } else {
          context.read<FavoriteCubit>().addMovieToFavorite(movie.id.toInt());
          Future.delayed(Duration(seconds: 1), () {
            context.read<FavoriteCubit>().featchFavoriteMovies();
          });
        }
      },
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoad || state is SuccessAddMoviesToFavorite) {
            return Center(child: CircularProgressIndicator());
          }
          return context.watch<FavoriteCubit>().favoriteMovie.isExist(movie)
              ? Icon(Icons.favorite, color: Colors.red)
              : Icon(Icons.favorite);
        },
      ),
    );
  }
}
