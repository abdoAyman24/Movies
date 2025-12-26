import 'package:dartz/dartz.dart';
import 'package:movies/core/error/auth_faluire_service.dart';
import 'package:movies/feature/auth/domain/entity/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> siginWithEmailAndPassword({
    required String email,
    required String password,
  });
}
