import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';
import 'package:movies/feature/list/presentation/manager/cubit/watched_list_cubit.dart';

class AddToWatchedListWidget extends StatelessWidget {
  const AddToWatchedListWidget({super.key, required this.movie});
  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (context
            .read<WatchedListCubit>()
            .watchedListMovies
            .isExistInWatchedList(movie)) {
          context.read<WatchedListCubit>().deleteMovieFromWatchedList(movie);
        } else {
          context.read<WatchedListCubit>().addMovieToWatchedList(movie);
        }
      },
      child: BlocConsumer<WatchedListCubit, WatchedListState>(
        listener: (context, state) {
          if (state is AddMovieToWatchedListSuccess ||
              state is DeleteMoviefromWatchedListSuccess) {
            context.read<WatchedListCubit>().featchWatchedList();
          }
        },
        builder: (context, state) {
          if (state is WatchedListLoad ||
              state is AddMovieToWatchedListSuccess ||
              state is DeleteMoviefromWatchedListSuccess) {
            return Center(child: CircularProgressIndicator());
          }
          return context
                  .read<WatchedListCubit>()
                  .watchedListMovies
                  .isExistInWatchedList(movie)
              ? Icon(Icons.bookmark, color: Colors.amber)
              : Icon(Icons.bookmark);
        },
      ),
    );
  }
}
