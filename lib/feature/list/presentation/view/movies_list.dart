import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/service/service_locator.dart';
import 'package:movies/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:movies/feature/list/presentation/manager/cubit/watched_list_cubit.dart';
import 'package:movies/feature/list/presentation/view/widget/movies_list_view.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({super.key});
  static const String routeName = 'moviesList';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => WatchedListCubit(getIt.get<HomeRemoteDataSource>()),
        child: Scaffold(body: MoviesListViewBody()),
      ),
    );
  }
}
