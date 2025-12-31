import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/service/service_locator.dart';
import 'package:movies/core/widget/custom_back_ground.dart';
import 'package:movies/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:movies/feature/home/presentation/manager/movie_search_cubit/movie_search_cubit.dart';
import 'package:movies/feature/home/presentation/view/widget/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieSearchCubit(getIt.get<HomeRemoteDataSource>()),
      child: Stack(
        children: [
          CustomBackGround(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SearchViewBody(),
          ),
        ],
      ),
    );
  }
}
