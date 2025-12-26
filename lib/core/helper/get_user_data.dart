import 'dart:convert';

import 'package:movies/conatant.dart';
import 'package:movies/core/cache/cach_helper_with_secure.dart';
import 'package:movies/feature/auth/data/model/user_model.dart';
import 'package:movies/feature/auth/domain/entity/user_entity.dart';

UserEntity getUser() {
  var jsonData = CacheHelper.getString(key: KUserData);
  var userEntitt = UserModel.fromJson(jsonDecode(jsonData!)).toEntity();
  return userEntitt;
}
