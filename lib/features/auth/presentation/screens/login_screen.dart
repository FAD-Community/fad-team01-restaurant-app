import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ka3da/core/api/dio_consumer.dart';
import 'package:ka3da/core/cache/cache_helper.dart';
import 'package:ka3da/core/network/network_info.dart';
import 'package:ka3da/core/routing/app_routes.dart';
import 'package:ka3da/core/theme/colors.dart';
import 'package:ka3da/core/widgets/custom_snackbar.dart';
import 'package:ka3da/features/auth/data/datasource/login_local_data_source.dart';
import 'package:ka3da/features/auth/data/datasource/login_remote_data_source.dart';
import 'package:ka3da/features/auth/data/repositories/login_repository_impl.dart';
import 'package:ka3da/features/auth/domain/usecases/login_usecase.dart';
import 'package:ka3da/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:ka3da/features/auth/presentation/widgets/core/widgets/auth_button.dart';
import 'package:ka3da/features/auth/presentation/widgets/core/widgets/auth_footer.dart';
import 'package:ka3da/features/auth/presentation/widgets/core/widgets/auth_social_section.dart';
import 'package:ka3da/features/auth/presentation/widgets/login/login_form.dart';
import 'package:ka3da/features/auth/presentation/widgets/login/login_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();

    passwordController.dispose();

    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  bool obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(
        LoginUsecase(
          repository: LoginRepositoryImpl(
            remoteDataSource: LoginRemoteDataSource(
              api: DioConsumer(dio: Dio()),
            ),
            localDataSource: LoginLocalDataSource(cacheHelper: CacheHelper()),
            networkInfo: NetworkInfoImpl(DataConnectionChecker()),
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              AppSnackBar.error(context, state.message);
            }

            if (state is LoginSuccess) {
              AppSnackBar.success(context, "Welcome back👋");

              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.mainLayout,
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LoginHeader(),

                    SizedBox(height: 32.h),

                    LoginAccountForm(
                      emailController: emailController,
                      passwordController: passwordController,
                      obscurePassword: obscurePassword,
                      onPasswordToggle: () {
                        setState(() {
                          obscurePassword = !obscurePassword;
                        });
                      },
                      formKey: formKey,
                    ),
                    SizedBox(height: 24.h),

                    AuthButton(
                      text: state is LoginLoading ? "Loading.." : "Signin",
                      onPressed: state is LoginLoading
                          ? null
                          : () {
                              if (formKey.currentState!.validate()) {
                                context.read<LoginCubit>().login(
                                  email: emailController.text.trim(),
                                  password: passwordController.text,
                                );
                              }
                            },
                    ),
                    SizedBox(height: 24.h),

                    const AuthSocialSection(),
                    SizedBox(height: 24.h),
                    AuthFooter(
                      title: 'New here?',
                      actionText: 'SignUp',
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.createAccountScreen,
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
