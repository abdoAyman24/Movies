import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/app_icon.dart';
import 'package:movies/feature/home/presentation/manager/now_play_cubit/now_play_cubit.dart';
import 'package:movies/feature/home/presentation/view/widget/movies_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NowPlayListViewItem extends StatefulWidget {
  const NowPlayListViewItem({super.key});

  @override
  State<NowPlayListViewItem> createState() => _NowPlayListViewItemState();
}

class _NowPlayListViewItemState extends State<NowPlayListViewItem> {
  @override
  void initState() {
    context.read<NowPlayCubit>().featchNowPlaying();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayCubit, NowPlayState>(
      builder: (context, state) {
        if (state is NowPlayLoad) {
          return Skeletonizer(
            enabled: true,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return AspectRatio(
                  aspectRatio: 0.8,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Image(image: AssetImage(Assets.imagesMovies)),
                  ),
                );
              },
            ),
          );
        } else if (state is NowPlaySuccess) {
          return MoviesListView(movies: state.movies);
        } else {
          return Icon(Icons.error);
        }
      },
    );
  }
}
