part of 'top_rate_cubit.dart';

sealed class TopRateState extends Equatable {
  const TopRateState();

  @override
  List<Object> get props => [];
}

final class TopRateInitial extends TopRateState {}

final class TopRateLoad extends TopRateState {}

final class TopRateSuccess extends TopRateState {
  final List<MovieEntity> movies;

  TopRateSuccess({required this.movies});
}

final class TopRateFailure extends TopRateState {
  final String errorMessage;
  final IconData icon;
  TopRateFailure( {required this.icon, required this.errorMessage});
}
