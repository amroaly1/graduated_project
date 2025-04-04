import 'package:flutter/material.dart';
import 'package:graduate_project/features/auth/login/presentation/widget/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginBody(),
    );
  }
}
