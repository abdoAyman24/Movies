import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';

import '../../../../../core/utils/end_point.dart';

part 'now_play_state.dart';

class NowPlayCubit extends Cubit<NowPlayState> {
  NowPlayCubit(this.homeRemoteDataSource) : super(NowPlayInitial());
  final HomeRemoteDataSource homeRemoteDataSource;

  void featchNowPlaying() async {
    emit(NowPlayLoad());
    var result = await homeRemoteDataSource.featchMovies(
      movieType: EndPoint.nowPlay,
    );

    result.fold(
      (l) {
       
        emit(NowPlayFailure(errorMessage: l.message));
      },
      (r) {
        

        emit(NowPlaySuccess(movies: r));
      },
    );
  }
}
