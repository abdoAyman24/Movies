import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/dummy/dummy_movies.dart';
import 'package:movies/core/widget/custom_movies_error_widget.dart';
import 'package:movies/feature/home/presentation/manager/popular_cubit/popular_cubit.dart';
import 'package:movies/feature/home/presentation/view/widget/movies_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PopularListViewItem extends StatefulWidget {
  const PopularListViewItem({super.key});

  @override
  State<PopularListViewItem> createState() => _PopularListViewItemState();
}

class _PopularListViewItemState extends State<PopularListViewItem> {
  @override
  void initState() {
    context.read<PopularCubit>().featchPopular();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularCubit, PopularState>(
      builder: (context, state) {
        if (state is PopularLoad) {
          return Skeletonizer(
            enabled: true,
            child:  MoviesListView(movies: dummyMovies,isLoad: true,),
          );
        } else if (state is PopularSuccess) {
          return MoviesListView(movies: state.movies);
        }else if (state is PopularFailure) {
          return CustomMoviesErrorWidget(
            errorMessage: state.errorMessage,
            icon: state.icon,
          );
        } else {
          return Icon(Icons.error);
        }
      },
    );
  }
}
