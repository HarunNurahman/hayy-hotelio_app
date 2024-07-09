import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_button.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_textformfield.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                  'Create\nNew Account',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 16),
                // Name input
                const CustomTextFormField(
                  controller: null,
                  hintText: 'Full Name',
                ),
                const SizedBox(height: 16),
                // Email input
                const CustomTextFormField(
                  controller: null,
                  hintText: 'Email Address',
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                // Password Input
                const CustomTextFormField(
                  controller: null,
                  hintText: 'Password',
                  isObsecure: true,
                ),
                const SizedBox(height: 30),
                // Sign up button
                CustomButton(
                  text: 'Sign Up',
                  onPressed: () => Navigator.pushNamed(context, '/sign-in'),
                ),
                const SizedBox(height: 30),
                // Sign in button
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/sign-in'),
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Text(
                      'Sign In to My Account',
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
    );
  }
}
