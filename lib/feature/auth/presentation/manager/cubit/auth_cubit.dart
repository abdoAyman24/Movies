import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/feature/auth/domain/entity/user_entity.dart';
import 'package:movies/feature/auth/domain/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(AuthInLoad());
    var result = await authRepo.createUserWithEmailAndPassword(
      name: name,
      email: email,
      password: password,
    );
    result.fold(
      (l) {
        emit(AuthFailure(errorMessage: l.message));
      },
      (r) {
        log('success');
        emit(RegisterSuccess());
      },
    );
  }

  Future<void> siginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(AuthInLoad());
    var result = await authRepo.siginWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (l) {
        emit(AuthFailure(errorMessage: l.message));
      },
      (r) {
        emit(SignInSuccess(userEntity: r));
      },
    );
  }
}
