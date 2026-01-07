import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:movies/feature/home/domain/entity/movie_entity.dart';
import 'package:movies/feature/home/domain/repos/home_repo.dart';

part 'trend_state.dart';

class TrendCubit extends Cubit<TrendState> {
  TrendCubit(this.homeRepo) : super(TrendInitial());

  final HomeRepo homeRepo;

  void featchPopularIntTisWeek() async {
    emit(TrendLoad());
    var result = await homeRepo.featchPopularThisWeek(
      
    );

    result.fold(
      (l) {
       
        emit(TrendFailure(errorMessage: l.message,icon: l.icon));
      },
      (r) {
        

        emit(TrendSuccess(movies: r));
      },
    );
  }
}
