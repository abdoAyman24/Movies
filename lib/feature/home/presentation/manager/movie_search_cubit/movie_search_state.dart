part of 'movie_search_cubit.dart';

sealed class MovieSearchState extends Equatable {
  const MovieSearchState();

  @override
  List<Object> get props => [];
}

final class MovieSearchInitial extends MovieSearchState {}

final class MovieSearchLoad extends MovieSearchState {}

final class MovieSearchSuccess extends MovieSearchState {
  final List<MovieEntity> movies;

  MovieSearchSuccess({required this.movies});
}

final class MovieSearchFailure extends MovieSearchState {
  final String errorMessage;
  final IconData icon;

  MovieSearchFailure({required this.errorMessage,required this.icon});
}
