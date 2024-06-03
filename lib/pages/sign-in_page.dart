import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_button.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_textformfield.dart';
import 'package:hayy_hotelio_app/shared/shared_method.dart';
import 'package:hayy_hotelio_app/shared/style.dart';
import 'package:hayy_hotelio_app/sources/user_source.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  login(BuildContext context) {
    if (formKey.currentState!.validate()) {
      UserSource.signIn(emailController.text, passwordController.text).then(
        (response) {
          if (response['success']) {
            showCustomSnackBar(context, response['message']);
            Get.toNamed('/dashboard');
          } else {
            showCustomSnackBar(context, response['message']);
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/app_logo.png',
                        width: 160,
                      ),
                    ),
                    const SizedBox(height: 100),
                    Text(
                      'Sign In\nTo Your Account',
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Email Input
                    CustomTextFormField(
                      textController: emailController,
                      hintText: 'Email Address',
                    ),
                    const SizedBox(height: 16),
                    // Password Input
                    CustomTextFormField(
                      textController: passwordController,
                      hintText: 'Password',
                      obsecureText: true,
                    ),
                    const SizedBox(height: 30),
                    // Sign In Button
                    CustomButton(
                      text: 'Sign In',
                      width: double.infinity,
                      height: 50,
                      onTap: () => login(context),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: GestureDetector(
                        onTap: () => Get.toNamed('/sign-up'),
                        child: Text(
                          'Create New Account',
                          style: grayTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
