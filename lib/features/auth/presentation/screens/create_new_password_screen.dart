import 'package:flutter/material.dart';
import 'package:ka3da/features/auth/presentation/widgets/create_new_password/create_new_password_form.dart';
import 'package:ka3da/features/auth/presentation/widgets/create_new_password/create_new_password_header.dart';
import 'package:ka3da/features/auth/presentation/widgets/create_new_password/create_new_password_progress.dart';


class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  bool obscureNew = true;
  bool obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CreateNewPasswordProgress(),

              const SizedBox(height: 40),

              const CreateNewPasswordHeader(),

              const SizedBox(height: 32),

              CreateNewPasswordForm(
                obscureNew: obscureNew,
                obscureConfirm: obscureConfirm,
                onToggleNew: () {
                  setState(() {
                    obscureNew = !obscureNew;
                  });
                },
                onToggleConfirm: () {
                  setState(() {
                    obscureConfirm = !obscureConfirm;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}