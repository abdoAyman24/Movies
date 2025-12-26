part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthInLoad extends AuthState {}

final class RegisterSuccess extends AuthState {}

final class SignInSuccess extends AuthState {
  final UserEntity userEntity;

  SignInSuccess({required this.userEntity});
}

final class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure({required this.errorMessage});
}
