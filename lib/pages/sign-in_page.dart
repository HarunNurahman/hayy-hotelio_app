import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayy_hotelio_app/bloc/auth/auth_bloc.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_button.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_textformfield.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Validasi input agar tidak kosong
  bool validate() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // Apabila auth gagal
          if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: redColor,
                content: Text(state.errorMessage),
              ),
            );
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/dashboard',
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: darkGrayColor,
              ),
            );
          }
          return Center(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                // App logo
                Image.asset('assets/images/app_logo.png', height: 70),
                const SizedBox(height: 100),
                // Content and form
                Text(
                  'Sign In\nTo Your Account',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 16),
                // Email input
                CustomTextFormField(
                  controller: emailController,
                  hint: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                // Password input
                CustomTextFormField(
                  controller: passwordController,
                  hint: 'Password',
                  keyboardType: TextInputType.text,
                  isObsecure: true,
                ),
                const SizedBox(height: 30),
                // Sign in button
                CustomButton(
                  text: 'Sign In',
                  onPressed: () {
                    if (validate()) {
                      context.read<AuthBloc>().add(
                            AuthSignIn(
                              emailController.text,
                              passwordController.text,
                            ),
                          );
                      setState(() {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: greenColor,
                            content: Text(
                              'Sign in success, welcome!',
                              style: whiteTextStyle,
                            ),
                          ),
                        );
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: redColor,
                          content: Text(
                            'Email and password cannot be empty',
                            style: whiteTextStyle,
                          ),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 30),
                // Sign up button
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/sign-up'),
                  child: Text(
                    'Create New Account',
                    style: grayTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
