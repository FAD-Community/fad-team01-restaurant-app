import 'package:flutter/material.dart';
import 'package:ka3da/features/auth/presentation/widgets/otp/otp_code_fields.dart';
import 'package:ka3da/features/auth/presentation/widgets/otp/otp_header.dart';
import 'package:ka3da/features/auth/presentation/widgets/otp/otp_progress.dart';
import 'package:ka3da/features/auth/presentation/widgets/otp/otp_resend_code.dart';
import 'package:ka3da/features/auth/presentation/widgets/otp/otp_verify_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const OtpProgress(),

              const SizedBox(height: 40),

              const OtpHeader(),

              const SizedBox(height: 40),

              Container(
                alignment:Alignment.center,
                child: OtpCodeFields(
                  onCompleted: (){
                    setState(() {
                      isCompleted = true;
                    });
                  },
                  onChanged: (){
                    if(isCompleted){
                      setState(() {
                        isCompleted = false;
                      });
                    }
                  },
                ),
              ),

              const SizedBox(height: 40),

              OtpVerifyButton(
                enabled: isCompleted,
              ),

              const SizedBox(height: 24),

              const OtpResendCode(),

            ],
          ),
        ),
      ),
    );
  }
}