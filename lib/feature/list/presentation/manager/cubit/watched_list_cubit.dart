import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';

part 'watched_list_state.dart';

class WatchedListCubit extends Cubit<WatchedListState> {
  WatchedListCubit(this.homeRemoteDataSource) : super(WatchedListInitial());
  final HomeRemoteDataSource homeRemoteDataSource;

  void featchWatchedList() async {
    emit(WatchedListLoad());
     var result = await homeRemoteDataSource.featchWatchedlist(
     
     );

    result.fold(
      (l) {
        emit(WatchedListFailure(errorMessage: l.message));
      },
      (r) {
        emit(WatchedListSuccess(movies: r));
      
      },
    );
  }
}
