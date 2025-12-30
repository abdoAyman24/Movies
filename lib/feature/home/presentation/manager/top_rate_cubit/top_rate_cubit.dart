import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/utils/end_point.dart';
import 'package:movies/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';

part 'top_rate_state.dart';

class TopRateCubit extends Cubit<TopRateState> {
  TopRateCubit(this.homeRemoteDataSource) : super(TopRateInitial());
  final HomeRemoteDataSource homeRemoteDataSource;

void featchTopRate() async {
    emit(TopRateLoad());
    var result = await homeRemoteDataSource.featchMovies(
      movieType: EndPoint.topRate,
    );

    result.fold(
      (l) {
       
        emit(TopRateFailure(errorMessage: l.message));
      },
      (r) {
        

        emit(TopRateSuccess(movies: r));
      },
    );
  }
}
