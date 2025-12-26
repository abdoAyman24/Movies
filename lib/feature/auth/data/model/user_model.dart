import 'package:movies/feature/auth/domain/entity/user_entity.dart';

class UserModel {
  final String name;
  final String email;

  UserModel({required this.name, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(name: json['name'], email: json['email']);
  }
  UserEntity toEntity() {
    return UserEntity(name: name, email: email);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email};
  }
}
