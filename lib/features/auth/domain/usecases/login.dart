import 'package:dartz/dartz.dart';
import 'package:ka3da/core/errors/failure.dart';
import 'package:ka3da/core/params/params.dart';
import 'package:ka3da/features/auth/domain/entities/login_entity.dart';
import 'package:ka3da/features/auth/domain/repositories/login_repository.dart';

class Login {
  final LoginRepository repository;

  Login({required this.repository});
  Future<Either<Failure, LoginEntity>> call({required LogInParams params}) {
    return repository.logIn(params: params);
  }
}
