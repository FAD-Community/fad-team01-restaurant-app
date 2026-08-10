import 'package:ka3da/core/api/end_points.dart';
import 'package:ka3da/features/auth/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    required super.id,
    required super.email,
    required super.token,
    required super.role,
    required super.firstName,
    required super.lastName,
    required super.userName,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json[ApiKey.id],
      email: json[ApiKey.email],
      token: json[ApiKey.token],
      role: json[ApiKey.role],
      firstName: json[ApiKey.firstName],
      lastName: json[ApiKey.lastName],
      userName: json[ApiKey.userName],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      ApiKey.id: id,
      ApiKey.firstName: firstName,
      ApiKey.lastName: lastName,
      ApiKey.userName: userName,
      ApiKey.email: email,
      ApiKey.token: token,
      ApiKey.role: role,
    };
  }
}
