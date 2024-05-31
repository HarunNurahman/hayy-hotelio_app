import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_button.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_textformfield.dart';
import 'package:hayy_hotelio_app/shared/style.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final nameController = TextEditingController();
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
                    'Create\nNew Account',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Full name input
                  CustomTextFormField(
                    textController: nameController,
                    hintText: 'Full Name',
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
                    text: 'Sign Up',
                    width: double.infinity,
                    height: 50,
                    onTap: () => Get.toNamed('/dashboard'),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: GestureDetector(
                      onTap: () => Get.toNamed('/sign-in'),
                      child: Text(
                        'Sign In to My Account',
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
