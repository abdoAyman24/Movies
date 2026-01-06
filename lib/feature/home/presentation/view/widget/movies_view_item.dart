import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/app_color.dart';
import 'package:movies/core/utils/app_text_styles.dart';
import 'package:movies/core/widget/custom_cach_network_image.dart';
import 'package:movies/feature/favorite/presentation/manager/cubit/favorite_cubit.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';
import 'package:movies/feature/home/presentation/view/widget/movie_detailes.dart';
import 'package:movies/feature/home/presentation/view/widget/star.dart';

class MoviesViewItem extends StatelessWidget {
  const MoviesViewItem({super.key, required this.movie});
  final MovieEntity movie;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          MovieDetailes.routeName,
          arguments: {
            'Movie': movie, // MovieEntity
            'favoriteCubit': context.read<FavoriteCubit>(),
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: BoxBorder.all(width: 1.3, color: AppColor.grey),
          borderRadius: BorderRadius.circular(10),
          color: AppColor.black.withValues(alpha: 0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 0.80,
                child: CustomCachNetworkImage(imageUrl: movie.posterPath),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: AppText.bold18.copyWith(
                        overflow: TextOverflow.ellipsis,
                        fontStyle: FontStyle.italic,
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 5),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Popular',
                          style: AppText.medium15.copyWith(
                            overflow: TextOverflow.ellipsis,
                            fontStyle: FontStyle.italic,
                          ),
                        ),

                        Text(
                          movie.popularity.toString(),
                          style: AppText.semiBold16,
                        ),
                      ],
                    ),
                    const SizedBox(height: 7),
                    StarRating(rating: movie.voteAverage),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
