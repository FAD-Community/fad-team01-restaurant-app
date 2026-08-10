import 'package:dartz/dartz.dart';
import 'package:ka3da/core/errors/failure.dart';
import 'package:ka3da/core/params/login_params.dart';
import 'package:ka3da/features/auth/domain/entities/login_entity.dart';
import 'package:ka3da/features/auth/domain/repositories/login_repository.dart';

class LoginUsecase {
  final LoginRepository repository;

  LoginUsecase({required this.repository});
  Future<Either<Failure, LoginEntity>> call({required LogInParams params}) {
    return repository.login(params: params);
  }
}
