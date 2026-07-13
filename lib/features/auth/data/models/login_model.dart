import 'package:ka3da/core/databases/api/end_points.dart';
import 'package:ka3da/features/auth/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    required super.id,
    required super.userName,
    required super.email,
    required super.token,
    required super.role,
    required super.firstName,
    required super.lastName,
  });
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json[ApiKey.id],
      userName: json[ApiKey.userName],
      email: json[ApiKey.email],
      token: json[ApiKey.token],
      role: json[ApiKey.role],
      firstName: json[ApiKey.firstName],
      lastName: json[ApiKey.lastName],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'email': email,
      'token': token,
      'role': role,
    };
  }
}
