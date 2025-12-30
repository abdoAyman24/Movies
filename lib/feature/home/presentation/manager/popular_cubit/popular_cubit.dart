import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:movies/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';

import '../../../../../core/utils/end_point.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit(this.homeRemoteDataSource) : super(PopularInitial());
  final HomeRemoteDataSource homeRemoteDataSource;

  void featchPopular() async {
    emit(PopularLoad());
    var result = await homeRemoteDataSource.featchMovies(
      movieType: EndPoint.popular,
    );

    result.fold(
      (l) {
        emit(PopularFailure(errorMessage: l.message));
      },
      (r) {
        emit(PopularSuccess(movies: r));
      },
    );
  }
}
