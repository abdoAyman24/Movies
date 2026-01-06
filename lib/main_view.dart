import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/service/service_locator.dart';
import 'package:movies/core/utils/app_color.dart';
import 'package:movies/feature/Profile/presentation/view/profile.dart';
import 'package:movies/feature/favorite/presentation/manager/cubit/favorite_cubit.dart';
import 'package:movies/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:movies/feature/home/presentation/manager/now_play_cubit/now_play_cubit.dart';
import 'package:movies/feature/home/presentation/manager/popular_cubit/popular_cubit.dart';
import 'package:movies/feature/home/presentation/manager/top_rate_cubit/top_rate_cubit.dart';
import 'package:movies/feature/home/presentation/view/home.dart';
import 'package:movies/feature/home/presentation/view/search_view.dart';
import 'package:movies/feature/favorite/presentation/view/favorite.dart';
import 'package:movies/feature/list/presentation/manager/cubit/watched_list_cubit.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const String routeName = 'home';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  @override
  void initState() {
    context.read<WatchedListCubit>().featchWatchedList();
    context.read<FavoriteCubit>().featchFavoriteMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              NowPlayCubit(getIt.get<HomeRemoteDataSource>()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              PopularCubit(getIt.get<HomeRemoteDataSource>()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              TopRateCubit(getIt.get<HomeRemoteDataSource>()),
        ),
      ],
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [Home(), SearchView(), Favorite(), Profile()],
        ),
        bottomNavigationBar: ConvexAppBar(
          items: [
            TabItem(
              icon: Icon(
                Icons.home,
                color: _currentIndex == 0 ? AppColor.primary : AppColor.grey,
                size: _currentIndex == 0 ? 40 : 30,
              ),
            ),
            TabItem(
              icon: Icon(
                Icons.search_sharp,
                color: _currentIndex == 1 ? AppColor.primary : AppColor.grey,
                size: _currentIndex == 1 ? 40 : 30,
              ),
            ),
            TabItem(
              icon: Icon(
                Icons.favorite,
                color: _currentIndex == 2 ? AppColor.primary : AppColor.grey,
                size: _currentIndex == 2 ? 40 : 30,
              ),
            ),
            TabItem(
              icon: Icon(
                Icons.person_2,
                color: _currentIndex == 3 ? AppColor.primary : AppColor.grey,
                size: _currentIndex == 3 ? 40 : 30,
              ),
            ),
          ],
          onTap: _chnageIndex,
          backgroundColor: AppColor.black.withValues(alpha: 0.4),
          height: 13.h,
          color: AppColor.black,
          activeColor: AppColor.grey.withValues(alpha: 0.2),
        ),
      ),
    );
  }

  void _chnageIndex(int index) {
    _currentIndex = index;
    setState(() {});
  }
}
