import 'package:dartz/dartz.dart';
import 'package:ka3da/core/errors/failure.dart';
import 'package:ka3da/features/auth/domain/entities/signup_entity.dart';

abstract class SignupRepository {
  Future<Either<Failure, SignupEntity>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  });
}
