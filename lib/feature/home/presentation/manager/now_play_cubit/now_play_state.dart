part of 'now_play_cubit.dart';

sealed class NowPlayState extends Equatable {
  const NowPlayState();

  @override
  List<Object> get props => [];
}

final class NowPlayInitial extends NowPlayState {}

final class NowPlayLoad extends NowPlayState {}

final class NowPlaySuccess extends NowPlayState {
  final List<MovieEntity> movies;

  NowPlaySuccess({required this.movies});
}

final class NowPlayFailure extends NowPlayState {
  final String errorMessage;
  final IconData icon;

  NowPlayFailure({required this.errorMessage,required this.icon});
}
