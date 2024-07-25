import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayy_hotelio_app/bloc/auth/auth_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/dashboard',
              (route) => false,
            );
          }

          if (state is AuthFailed) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/onboarding',
              (route) => false,
            );
          }
        },
        child: Center(
          child: Image.asset('assets/images/app_logo.png', width: 150),
        ),
      ),
    );
  }
}
