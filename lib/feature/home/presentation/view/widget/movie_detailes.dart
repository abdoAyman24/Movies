import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/utils/app_color.dart';
import 'package:movies/core/utils/app_text_styles.dart';
import 'package:movies/core/utils/end_point.dart';
import 'package:movies/core/widget/custom_back_ground.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';
import 'package:movies/feature/home/presentation/view/widget/back_bottom.dart';
import 'package:movies/feature/home/presentation/view/widget/star.dart';

class MovieDetailes extends StatelessWidget {
  const MovieDetailes({super.key, required this.movie});
  final MovieEntity movie;
  static const String routeName = 'MovieDetailes';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            CustomBackGround(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 120.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        width: double.infinity,
                        imageUrl: EndPoint.imageBaseUrl + movie.backdropPath,
                        fit: BoxFit.cover,
                      ),
                      BackBottom(onTap: () {}),

                      Positioned(
                        bottom: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Stack(
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          width: 30.w,
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                EndPoint.imageBaseUrl +
                                                movie.posterPath,
                                          ),
                                        ),
                                        const SizedBox(height: 15,),
                                      ],
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 70,
                                      right: 70,
                                      child: Container( 
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadiusGeometry.circular(25),
                                          color:Colors.red,
                                        ),
                                        child: Padding(padding: EdgeInsetsGeometry.all(15),
                                        child: Icon(Icons.play_arrow,color: AppColor.white,),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(children: []),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  movie.title,
                  style: AppText.bold28.copyWith(
                    fontStyle: FontStyle.italic,
                    color: Colors.red,
                    shadows: [
                      Shadow(color: AppColor.black, blurRadius: 100),
                      Shadow(color: AppColor.grey, blurRadius: 100),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StarRating(rating: movie.voteAverage),
                      const SizedBox(width: 10),
                      Text(
                        '${movie.voteAverage}/10',
                        style: AppText.medium24.copyWith(color: AppColor.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
