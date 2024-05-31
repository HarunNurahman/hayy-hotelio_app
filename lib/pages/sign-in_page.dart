import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_button.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_textformfield.dart';
import 'package:hayy_hotelio_app/shared/style.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              Column(
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
                    onTap: () => Get.toNamed('/dashboard'),
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
            ],
          ),
        ),
      ),
    );
  }
}
