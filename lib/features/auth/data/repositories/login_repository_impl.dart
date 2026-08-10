import 'package:dartz/dartz.dart';
import 'package:ka3da/core/errors/failure.dart';
import 'package:ka3da/core/network/network_info.dart';
import 'package:ka3da/core/params/login_params.dart';
import 'package:ka3da/features/auth/data/datasource/login_local_data_source.dart';
import 'package:ka3da/features/auth/data/datasource/login_remote_data_source.dart';
import 'package:ka3da/features/auth/domain/entities/login_entity.dart';
import 'package:ka3da/features/auth/domain/repositories/login_repository.dart';
import 'package:ka3da/core/errors/exceptions.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  final LoginLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, LoginEntity>> login({
    required LogInParams params,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await remoteDataSource.login(params: params);

        await localDataSource.saveToken(user.token);

        return Right(user);
      } on ServerException catch (e) {
        return Left(ServerFailure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      return Left(ServerFailure(errMessage: "No Internet Connection"));
    }
  }
}
