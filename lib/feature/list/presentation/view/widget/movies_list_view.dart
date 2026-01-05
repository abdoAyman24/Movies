import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/dummy/dummy_movies.dart';
import 'package:movies/core/utils/app_text_styles.dart';
import 'package:movies/core/widget/custom_back_ground.dart';
import 'package:movies/core/widget/custom_movies_grid_view_body.dart';
import 'package:movies/feature/list/presentation/manager/cubit/watched_list_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MoviesListViewBody extends StatefulWidget {
  const MoviesListViewBody({super.key});

  @override
  State<MoviesListViewBody> createState() => _MoviesListViewBodyState();
}

class _MoviesListViewBodyState extends State<MoviesListViewBody> {
  @override
  void initState() {
    context.read<WatchedListCubit>().featchWatchedList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomBackGround(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Play List',
                    style: AppText.bold28.copyWith(fontStyle: FontStyle.italic),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              BlocBuilder<WatchedListCubit, WatchedListState>(
                builder: (context, state) {
                  if (state is WatchedListLoad) {
                    return Expanded(
                      child: Skeletonizer(
                        child: CustomMoviesGridViewBody(movies: dummyMovies),
                      ),
                    );
                  } else if (state is WatchedListSuccess) {
                    return Expanded(
                      child: CustomMoviesGridViewBody(movies: dummyMovies),
                    );
                  } else {
                    return Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Column(
                                children: [
                                  Icon(Icons.list_outlined, size: 50),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Watched list is empty',
                                    style: AppText.bold20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
