import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';

part 'movie_search_state.dart';

class MovieSearchCubit extends Cubit<MovieSearchState> {
  MovieSearchCubit(this.homeRemoteDataSource) : super(MovieSearchInitial());
  final HomeRemoteDataSource homeRemoteDataSource;

  void movieSearch({required String movietitle})async{
    emit(MovieSearchLoad());
    var result = await homeRemoteDataSource.movieSearch(
     movietitle: movietitle
    );

    result.fold(
      (l) {
        emit(MovieSearchFailure(errorMessage: l.message));
      },
      (r) {
        emit(MovieSearchSuccess(movies: r));
       
      },
    );
  }
}
