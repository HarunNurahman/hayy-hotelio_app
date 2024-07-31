import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_button.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image background
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
          // Linear gradient
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, blackColor.withOpacity(0.8)],
              ),
            ),
          ),
          // Content
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Your Great Life\nStarts Here',
                    style: whiteTextStyle.copyWith(
                      fontSize: 36,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'More than just a hotel',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 60),
                  // Get started button
                  CustomButton(
                    text: 'Get Started',
                    onPressed: () => Navigator.pushNamed(context, '/sign-in'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
