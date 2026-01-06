part of 'watched_list_cubit.dart';

sealed class WatchedListState extends Equatable {
  const WatchedListState();

  @override
  List<Object> get props => [];
}

final class WatchedListInitial extends WatchedListState {}

final class WatchedListLoad extends WatchedListState {}
final class AddMovieToWatchedListSuccess extends WatchedListState {}
final class DeleteMoviefromWatchedListSuccess extends WatchedListState {}



final class WatchedListSuccess extends WatchedListState {
  final List<MovieEntity> movies;

  WatchedListSuccess({required this.movies});
}

final class WatchedListFailure extends WatchedListState {
  final String errorMessage;

  WatchedListFailure({required this.errorMessage});
}
