import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/feature/auth/presentation/View/login.dart';
import 'package:movies/feature/auth/presentation/View/register.dart';
import 'package:movies/feature/favorite/presentation/manager/cubit/favorite_cubit.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';
import 'package:movies/feature/home/presentation/view/main_view.dart';
import 'package:movies/feature/home/presentation/view/movies_grid_view.dart';
import 'package:movies/feature/home/presentation/view/widget/movie_detailes.dart';
import 'package:movies/feature/on_bording/presentation/view/on_bording.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case OnBording.routeName:
      return MaterialPageRoute(builder: (context) => OnBording());

    case Login.routeName:
      return MaterialPageRoute(builder: (context) => Login());
    case Register.routeName:
      return MaterialPageRoute(builder: (context) => Register());

    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => MainView());

    case MovieDetailes.routeName:
      final args = setting.arguments as Map<String, dynamic>;

      final movies = args['Movie'] as MovieEntity;
      final favoriteCubit = args['favoriteCubit'] as FavoriteCubit;

      return MaterialPageRoute(
    builder: (context) => MultiBlocProvider(
      providers: [
        
        BlocProvider.value(value: favoriteCubit),
      ],
      child: MovieDetailes(movie:movies ),
    ),
      );

    case MoviesGridView.routName:
      return MaterialPageRoute(
        builder: (context) =>
            MoviesGridView(movies: setting.arguments as List<MovieEntity>),
      );

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
