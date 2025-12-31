import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/dummy/dummy_movies.dart';
import 'package:movies/core/utils/app_color.dart';
import 'package:movies/core/widget/custom_text_form_field.dart';
import 'package:movies/feature/home/presentation/manager/movie_search_cubit/movie_search_cubit.dart';
import 'package:movies/feature/home/presentation/view/widget/movies_grid_view_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        CustomTextForm(
          textColor: AppColor.white,
          hint: 'Search',
          onSave: (value) {
            context.read<MovieSearchCubit>().movieSearch(movietitle: value);
          },
          keyboardType: TextInputType.text,
          textFormColor: AppColor.black.withValues(alpha: 0.5),
          preffixIcon: Icon(Icons.search_rounded, color: AppColor.white),
        ),
        BlocBuilder<MovieSearchCubit, MovieSearchState>(
          builder: (context, state) {
            if (state is MovieSearchLoad) {
              return Expanded(
                child: Skeletonizer(
                  enabled: true,
                  child: MoviesGridViewBody(movies: dummyMovies),
                ),
              );
            } else if (state is MovieSearchSuccess) {
              return Expanded(child: MoviesGridViewBody(movies: state.movies));
            } else {
              return Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Icon(
                        Icons.manage_search_outlined,
                        color: AppColor.white,
                        size: 100,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
