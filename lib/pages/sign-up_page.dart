import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayy_hotelio_app/bloc/auth/auth_bloc.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_button.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_textformfield.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Validasi input apakah ada yang kosong
  bool validate() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
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
                  'Create\nNew Account',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 16),
                // Name input
                CustomTextFormField(
                  controller: nameController,
                  hint: 'Full Name',
                  keyboardType: TextInputType.text,
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
                  text: 'Sign Up',
                  onPressed: () {
                    if (validate()) {
                      context.read<AuthBloc>().add(
                            AuthSignUp(
                              nameController.text,
                              emailController.text,
                              passwordController.text,
                            ),
                          );
                      print('Sign up success');
                    }
                  },
                ),
                const SizedBox(height: 30),
                // Sign up button
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/sign-in'),
                  child: Text(
                    'Sign In to My Account',
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
