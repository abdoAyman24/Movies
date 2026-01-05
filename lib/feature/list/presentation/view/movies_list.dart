import 'package:flutter/material.dart';
import 'package:movies/feature/list/presentation/view/widget/movies_list_view.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({super.key});
  static const String routeName = 'moviesList';
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: MoviesListViewBody()));
  }
}
