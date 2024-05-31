import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_button.dart';
import 'package:hayy_hotelio_app/shared/style.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/img_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Gradient background color
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, blackColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Onboarding content
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Great Life Starts Here',
                    style: whiteTextStyle.copyWith(
                      fontSize: 36,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'More than just a hotel',
                    style: whiteTextStyle.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 50),
                  // Button
                  CustomButton(
                    text: 'Get Started',
                    width: double.infinity,
                    height: 50,
                    onTap: () => Get.toNamed('/sign-in'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
