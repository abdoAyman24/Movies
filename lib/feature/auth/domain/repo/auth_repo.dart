import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failuer.dart';
import 'package:movies/feature/auth/domain/entity/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failuer, void>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failuer, UserEntity>> siginWithEmailAndPassword({
    required String email,
    required String password,
  });
}
