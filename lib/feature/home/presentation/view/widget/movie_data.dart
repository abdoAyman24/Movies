import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/utils/app_text_styles.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';
import 'package:movies/feature/home/presentation/view/widget/star.dart';

class MovieData extends StatelessWidget {
  const MovieData({super.key, required this.movie});

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                Text(
                  'Released',
                  style: AppText.medium15.copyWith(fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 8),
                Text(
                  'Popular',
                  style: AppText.medium15.copyWith(fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 8),
              ],
            ),
            const SizedBox(width: 15),
            Column(
              children: [
                Text(movie.releaseDate, style: AppText.medium15),
                const SizedBox(height: 8),

                Text(movie.popularity.toString(), style: AppText.medium15),
                const SizedBox(height: 8),
              ],
            ),
          ],
        ),
        StarRating(rating: movie.voteAverage),
        SizedBox(height: 15.h),
        SizedBox(
          width: 80.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Icon(Icons.add),
                  Text('My List', style: AppText.regular16),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.favorite, color: Colors.red),
                  Text('Like', style: AppText.regular16),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.ios_share_outlined),
                  Text('Share', style: AppText.regular16),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
