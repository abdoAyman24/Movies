import 'package:flutter/material.dart';
import 'package:movies/core/utils/app_color.dart';

class StarRating extends StatelessWidget {
  const StarRating({super.key, required this.rating, this.starSize = 30});

  final double rating; // من 0 إلى 10
  final double starSize;

  @override
  Widget build(BuildContext context) {
    final double convertedRating = rating / 2; // تحويل لـ 5 نجوم

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (convertedRating >= index + 1) {
          return Icon(Icons.star, color: AppColor.amber, size: starSize);
        } else if (convertedRating > index && convertedRating < index + 1) {
          return Icon(Icons.star_half, color: AppColor.amber, size: starSize);
        } else {
          return Icon(Icons.star_border, color: Colors.grey, size: starSize);
        }
      }),
    );
  }
}


// if (rating > index) {
          //   return Icon(Icons.star_purple500_sharp, color: AppColor.primary);
          // } else if (index - 1 > rating || rating > index) {
          //   return Icon(Icons.star_half_sharp);
          // } else {
          //   return Icon(Icons.star_border_sharp);
          // }