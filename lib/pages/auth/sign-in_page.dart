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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            print(state.errorMessage);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: redColor,
                content: Text(state.errorMessage),
              ),
            );
          }

          if (state is AuthSuccess) {
            print(state.user);
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
          } else if (state is AuthFailed) {
            print(state.errorMessage);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: redColor,
                content: Text(state.errorMessage),
              ),
            );
          }
          print(state);
          return Center(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // App logo
                    Center(
                      child: Image.asset(
                        'assets/images/app_logo.png',
                        width: 160,
                      ),
                    ),
                    const SizedBox(height: 100),
                    // Content
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
                      hintText: 'Email Address',
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    // Password Input
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: 'Password',
                      isObsecure: true,
                    ),
                    const SizedBox(height: 30),
                    // Sign in button
                    CustomButton(
                      text: 'Sign In',
                      onPressed: () => context.read<AuthBloc>().add(
                            AuthSignIn(
                              emailController.text,
                              passwordController.text,
                            ),
                          ),
                    ),
                    const SizedBox(height: 30),
                    // Sign up button
                    Center(
                      child: TextButton(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          '/sign-up',
                        ),
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: Text(
                          'Create New Account',
                          style: grayTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
