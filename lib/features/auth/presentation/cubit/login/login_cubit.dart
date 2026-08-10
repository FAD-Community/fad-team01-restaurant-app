import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ka3da/core/params/login_params.dart';
import 'package:ka3da/features/auth/domain/entities/login_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ka3da/features/auth/domain/usecases/login_usecase.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      final result = await loginUseCase(
        params: LogInParams(email: email, password: password),
      );
      result.fold(
        (failure) {
          emit(LoginFailure(message: failure.errMessage));
        },
        (user) {
          emit(LoginSuccess(user: user));
        },
      );
    } catch (e, s) {}
  }
}
