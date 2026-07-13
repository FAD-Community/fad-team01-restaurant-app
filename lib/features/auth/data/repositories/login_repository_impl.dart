import 'package:dartz/dartz.dart';
import 'package:ka3da/core/connection/network_info.dart';
import 'package:ka3da/core/errors/expentions.dart';
import 'package:ka3da/core/errors/failure.dart';
import 'package:ka3da/core/params/params.dart';
import 'package:ka3da/features/auth/data/datasources/login_local_data_source.dart';
import 'package:ka3da/features/auth/data/datasources/login_remote_data_source.dart';
import 'package:ka3da/features/auth/domain/entities/login_entity.dart';
import 'package:ka3da/features/auth/domain/repositories/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final NetworkInfo networkInfo;
  final LoginRemoteDataSource remoteDataSource;
  final LoginLocalDataSource localDataSource;

  LoginRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.localDataSource,
  });
  @override
  Future<Either<Failure, LoginEntity>> logIn({
    required LogInParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final login = await remoteDataSource.logIn  (params);
        localDataSource.saveUser(
          token: login.token,
          firstName: login.firstName,
        );
        return Right(login);
      } on ServerException catch (e) {
        return left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(Failure(errMessage: "No Internet Connection"));
    }
  }
}
