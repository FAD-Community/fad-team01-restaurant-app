import 'package:dartz/dartz.dart';
import 'package:ka3da/core/errors/failure.dart';
import 'package:ka3da/core/params/params.dart';
import 'package:ka3da/features/auth/domain/entities/login_entity.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginEntity>> logIn({required LogInParams params});
}
