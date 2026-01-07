import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/dummy/dummy_movies.dart';
import 'package:movies/core/widget/custom_movies_error_widget.dart';

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
            child: MoviesListView(movies: dummyMovies,isLoad: true,),
          );
        } else if (state is TrendSuccess) {
          return MoviesListView(movies: state.movies);
        }else if (state is TrendFailure) {
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