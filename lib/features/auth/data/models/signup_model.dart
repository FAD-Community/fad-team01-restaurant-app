import 'package:ka3da/features/auth/domain/entities/signup_entity.dart';

class SignupModel extends SignupEntity {
  SignupModel({required super.message});
  factory SignupModel.fromJson(Map<String, dynamic> jsonData) {
    return SignupModel(message: jsonData['message'] ?? '');
  }
}
