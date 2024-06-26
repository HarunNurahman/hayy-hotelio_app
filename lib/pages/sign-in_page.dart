import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_button.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_textformfield.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
            const CustomTextFormField(
              hint: 'example@email.com',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            // Password input
            const CustomTextFormField(
              hint: 'Password',
              keyboardType: TextInputType.text,
              isObsecure: true,
            ),
            const SizedBox(height: 30),
            // Sign in button
            CustomButton(
              text: 'Sign In',
              onPressed: () {},
            ),
            const SizedBox(height: 30),
            // Sign up button
            TextButton(
              onPressed: () {},
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
      ),
    );
  }
}
