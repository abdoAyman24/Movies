part of 'favorite_cubit.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoad extends FavoriteState {}
final class AddMoviesToFavorite extends FavoriteState {}
final class SuccessAddMoviesToFavorite extends FavoriteState {}

final class RemoveMovieFromFavorite extends FavoriteState {}


final class FavoriteSuccess extends FavoriteState {
  final List<MovieEntity> movies;

  FavoriteSuccess({required this.movies});
}

final class FavoriteFailure extends FavoriteState {
  final String errorMessage;

  FavoriteFailure({required this.errorMessage});
}
