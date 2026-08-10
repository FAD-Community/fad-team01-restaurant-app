import 'package:ka3da/core/api/api_consumer.dart';
import 'package:ka3da/core/api/end_points.dart';
import 'package:ka3da/features/auth/data/models/signup_model.dart';

class SignupRemoteDataSource {
  final ApiConsumer api;

  SignupRemoteDataSource({required this.api});
  @override
  Future<SignupModel> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final response = await api.post(
      EndPoints.register,
      data: {
        firstName: ApiKey.firstName,
        lastName: ApiKey.lastName,
        email: ApiKey.email,
        password: ApiKey.password,
        confirmPassword: ApiKey.confirmPassword,
      },
    );
    return SignupModel.fromJson(response);
  }
}
