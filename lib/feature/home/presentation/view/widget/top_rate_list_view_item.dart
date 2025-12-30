import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/app_icon.dart';
import 'package:movies/feature/home/presentation/manager/top_rate_cubit/top_rate_cubit.dart';
import 'package:movies/feature/home/presentation/view/widget/movies_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TopRateListViewItem extends StatefulWidget {
  const TopRateListViewItem({super.key});

  @override
  State<TopRateListViewItem> createState() => _TopRateListViewItemState();
}

class _TopRateListViewItemState extends State<TopRateListViewItem> {
  @override
  void initState() {
    context.read<TopRateCubit>().featchTopRate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRateCubit, TopRateState>(
      builder: (context, state) {
        if (state is TopRateLoad) {
          return Skeletonizer(
            enabled: true,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return AspectRatio(
                  aspectRatio: 0.7,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Image(image: AssetImage(Assets.imagesMovies)),
                  ),
                );
              },
            ),
          );
        } else if (state is TopRateSuccess) {
          return MoviesListView(movies: state.movies);
        } else {
          return Icon(Icons.error);
        }
      },
    );
  }
}
