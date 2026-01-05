import 'package:flutter/material.dart';
import 'package:movies/core/dummy/dummy_movies.dart';
import 'package:movies/core/utils/app_text_styles.dart';
import 'package:movies/core/widget/custom_back_ground.dart';
import 'package:movies/core/widget/custom_movies_grid_view_body.dart';

class MoviesListViewBody extends StatelessWidget {
  const MoviesListViewBody({super.key});

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

              Expanded(child: CustomMoviesGridViewBody(movies: dummyMovies)),
            ],
          ),
        ),
      ],
    );
  }
}
