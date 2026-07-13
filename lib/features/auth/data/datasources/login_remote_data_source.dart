import 'package:ka3da/core/databases/api/api_consumer.dart';
import 'package:ka3da/core/databases/api/end_points.dart';
import 'package:ka3da/core/params/params.dart';
import 'package:ka3da/features/auth/data/models/login_model.dart';

class LoginRemoteDataSource {
  final ApiConsumer api;

  LoginRemoteDataSource({required this.api});

  Future<LoginModel> logIn(LogInParams params) async {
    final response = await api.post(
      EndPoints.login,
      data: {"email": params.email, "password": params.password},
    );
    return LoginModel.fromJson(response);
  }
}
