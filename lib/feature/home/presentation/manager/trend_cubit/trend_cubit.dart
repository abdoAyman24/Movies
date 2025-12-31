import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';

part 'trend_state.dart';

class TrendCubit extends Cubit<TrendState> {
  TrendCubit(this.homeRemoteDataSource) : super(TrendInitial());

  final HomeRemoteDataSource homeRemoteDataSource;

  void featchPopularIntTisWeek() async {
    emit(TrendLoad());
    var result = await homeRemoteDataSource.featchPopularThisWeek(
      
    );

    result.fold(
      (l) {
       
        emit(TrendFailure(errorMessage: l.message));
      },
      (r) {
        

        emit(TrendSuccess(movies: r));
      },
    );
  }
}
