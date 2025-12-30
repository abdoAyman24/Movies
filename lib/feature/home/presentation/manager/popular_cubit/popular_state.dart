part of 'popular_cubit.dart';

sealed class PopularState extends Equatable {
  const PopularState();

  @override
  List<Object> get props => [];
}

final class PopularInitial extends PopularState {}
final class PopularLoad extends PopularState {}
final class PopularSuccess extends PopularState {
  final List<MovieEntity> movies;

  PopularSuccess({required this.movies});
}
final class PopularFailure extends PopularState {
  final String errorMessage;

  PopularFailure({required this.errorMessage});
}

