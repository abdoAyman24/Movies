import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/app_text_styles.dart';
import 'package:movies/core/widget/custom_back_ground.dart';
import 'package:movies/feature/favorite/presentation/manager/cubit/favorite_cubit.dart';
import 'package:movies/feature/favorite/presentation/view/widget/favorite_view_body.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  void initState() {
    context.read<FavoriteCubit>().featchFavoriteMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          CustomBackGround(),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Text('Favorite ', style: AppText.bold28),
                const SizedBox(height: 15),
                FavoriteViewBody(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
