import 'package:ka3da/core/api/api_consumer.dart';
import 'package:ka3da/core/api/end_points.dart';
import 'package:ka3da/core/params/login_params.dart';
import 'package:ka3da/features/auth/data/models/login_model.dart';

class LoginRemoteDataSource {
  final ApiConsumer api;

  LoginRemoteDataSource({required this.api});

  Future<LoginModel> login({required LogInParams params}) async {
    final response = await api.post(
      EndPoints.login,
      data: {"email": params.email, "password": params.password},
    );
    return LoginModel.fromJson(response);
  }
}
