import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';
import 'package:movies/feature/list/presentation/manager/cubit/watched_list_cubit.dart';

class AddToWatchedListWidget extends StatefulWidget {
  const AddToWatchedListWidget({super.key, required this.movie});
  final MovieEntity movie;

  @override
  State<AddToWatchedListWidget> createState() => _AddToWatchedListWidgetState();
}

class _AddToWatchedListWidgetState extends State<AddToWatchedListWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (context
            .read<WatchedListCubit>()
            .watchedListMovies
            .isExistInWatchedList(widget.movie)) {
          context.read<WatchedListCubit>().deleteMovieFromWatchedList(
            widget.movie,
          );
          setState(() {});
        } else {
          context.read<WatchedListCubit>().addMovieToWatchedList(widget.movie);
          setState(() {});
        }
      },
      child: BlocBuilder<WatchedListCubit, WatchedListState>(
        builder: (context, state) {
          if (state is WatchedListLoad) {
            Center(child: CircularProgressIndicator());
          } 
            return context
                    .read<WatchedListCubit>()
                  .watchedListMovies
                    .isExistInWatchedList(widget.movie)
                ? Icon(Icons.bookmark, color: Colors.amber)
                : Icon(Icons.bookmark);
          
        },
      ),
    );
  }
}
