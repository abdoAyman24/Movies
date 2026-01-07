import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies/conatant.dart';
import 'package:movies/core/cache/cach_helper_with_secure.dart';
import 'package:movies/core/error/failuer.dart';
import 'package:movies/core/error/custom_fire_base_excption.dart';
import 'package:movies/core/service/data_base_service.dart';
import 'package:movies/core/service/firebase_auth_service.dart';
import 'package:movies/core/utils/end_point.dart';
import 'package:movies/feature/auth/data/model/user_model.dart';
import 'package:movies/feature/auth/domain/entity/user_entity.dart';
import 'package:movies/feature/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FireBaseAuthService fireBaseAuthService;
  final DataBaseService dataBaseService;

  AuthRepoImpl({
    required this.fireBaseAuthService,
    required this.dataBaseService,
  });

  @override
  Future<Either<Failuer, void>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      User user = await fireBaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel userModel = UserModel(name: name, email: email);
      await dataBaseService.addUser(
        path: EndPoint.userCollection,
        json: userModel.toJson(),
        documentId: user.uid,
      );

      return Right(null);
    } on CustomFireBaseExcption catch (e) {
      return left(ServerFailuer(message: e.errorMessage,icon: Icons.error_outline));
    }
  }

  @override
  Future<Either<Failuer, UserEntity>> siginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      User user = await fireBaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Map<String, dynamic> userData = await dataBaseService.getData(
        path: EndPoint.userCollection,
        documentId: user.uid,
      );
      UserModel userModel = UserModel.fromJson(userData);
      CacheHelper.set(key: KUserData, value: jsonEncode(userModel.toJson()));

      return right(userModel.toEntity());
    } on CustomFireBaseExcption catch (e) {
      return left(ServerFailuer(message: e.errorMessage,icon: Icons.error_outline));
    }
  }
}
