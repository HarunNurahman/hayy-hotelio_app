import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayy_hotelio_app/bloc/auth/auth_bloc.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_button.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_textformfield.dart';
import 'package:hayy_hotelio_app/shared/app_format.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: redColor,
                content: Text(
                  state.errorMessage,
                  style: whiteTextStyle,
                ),
              ),
            );
          }

          // if (state is AuthLoading) {
          //   setState(() {
          //     ScaffoldMessenger.of(context).showSnackBar(
          //       SnackBar(
          //         backgroundColor: redColor,
          //         content: Text(
          //           'Incorrect email or password',
          //           style: whiteTextStyle,
          //         ),
          //       ),
          //     );
          //   });
          // }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/dashboard',
              (route) => false,
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: greenColor,
                content: Text(
                  'Sign in success, welcome!',
                  style: whiteTextStyle,
                ),
              ),
            );
          }
        },
        child: Form(
          key: formKey,
          child: Center(
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
                      errorMessage: _errorMessage,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email address';
                        } else if (!emailRexExp.hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // Password Input
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: 'Password',
                      isObsecure: true,
                      errorMessage: _errorMessage,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                          // } else if (!passwordRexExp.hasMatch(value)) {
                          //   return 'Please enter a valid password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    // Sign in button
                    CustomButton(
                      text: 'Sign In',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // print('current state: $state');
                          context.read<AuthBloc>().add(
                                AuthSignIn(
                                  emailController.text,
                                  passwordController.text,
                                ),
                              );
                        }
                      },
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
          ),
        ),
      ),
    );
  }
}
