import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_button.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Hotel cover
            Container(
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(width: 10, color: whiteColor),
                image: const DecorationImage(
                  image: AssetImage('assets/images/img_hotel_1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 50),
            // Content
            Text(
              'Payment Success',
              style: blackTextStyle.copyWith(
                fontSize: 22,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Enjoy your a whole new experience\nin this beautiful world',
              style: blackTextStyle.copyWith(fontSize: 16, height: 1.8),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            // Button
            CustomButton(
              onPressed: () => Navigator.pushNamed(context, '/dashboard'),
              text: 'View My Booking',
              width: 210,
            )
          ],
        ),
      ),
    );
  }
}
