part of 'trend_cubit.dart';

sealed class TrendState extends Equatable {
  const TrendState();

  @override
  List<Object> get props => [];
}

final class TrendInitial extends TrendState {}

final class TrendLoad extends TrendState {}

final class TrendSuccess extends TrendState {
  final List<MovieEntity> movies;

  TrendSuccess({required this.movies});
}

final class TrendFailure extends TrendState {
  final String errorMessage;
  final IconData icon;
  TrendFailure({required this.icon, required this.errorMessage});
}
