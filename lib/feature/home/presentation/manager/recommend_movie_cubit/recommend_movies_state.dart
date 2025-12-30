part of 'recommend_movies_cubit.dart';

sealed class RecommendMoviesState extends Equatable {
  const RecommendMoviesState();

  @override
  List<Object> get props => [];
}

final class RecommendMoviesInitial extends RecommendMoviesState {}

final class RecommendMoviesLoad extends RecommendMoviesState {}

final class RecommendMoviesSuccess extends RecommendMoviesState {
  final List<MovieEntity> movies;

  RecommendMoviesSuccess({required this.movies});
}

final class RecommendMoviesFailure extends RecommendMoviesState {
  final String errorMessage;

  RecommendMoviesFailure({required this.errorMessage});
}
