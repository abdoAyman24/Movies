import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/dummy/dummy_movies.dart';

import 'package:movies/feature/home/presentation/manager/trend_cubit/trend_cubit.dart';
import 'package:movies/feature/home/presentation/view/widget/movies_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PopularThisWeekListView extends StatefulWidget {
  const PopularThisWeekListView({super.key});

  @override
  State<PopularThisWeekListView> createState() => _PopularThisWeekListViewState();
}

class _PopularThisWeekListViewState extends State<PopularThisWeekListView> {
  @override
  void initState() {
    context.read<TrendCubit>().featchPopularIntTisWeek(
      
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendCubit, TrendState>(
      builder: (context, state) {
        if (state is TrendFailure) {
          return Skeletonizer(
            enabled: true,
            child: MoviesListView(movies: dummyMovies),
          );
        } else if (state is TrendSuccess) {
          return MoviesListView(movies: state.movies);
        } else {
          return Icon(Icons.error);
        }
      },
    );
  }
}