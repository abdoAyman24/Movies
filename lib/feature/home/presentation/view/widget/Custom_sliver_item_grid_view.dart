import 'package:flutter/material.dart';
import 'package:movies/feature/home/presentation/view/widget/movie_item.dart';

class CustomSliverItemGridView extends StatelessWidget {
  const CustomSliverItemGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 214,
        mainAxisSpacing: 8,
        crossAxisSpacing: 14,
      ),
      itemBuilder: (context, index) {
        return MovieItem();
      },
    );
  }
}
