import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayy_hotelio_app/controllers/navigation_controller.dart';
import 'package:hayy_hotelio_app/models/hotel_model.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_button.dart';
import 'package:hayy_hotelio_app/shared/style.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final navigation = Get.put(NavigationController());
    HotelModel hotel = ModalRoute.of(context)!.settings.arguments as HotelModel;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: whiteColor, width: 6),
                color: whiteColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  hotel.cover!,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Text(
              'Payment Success',
              style: blackTextStyle.copyWith(
                fontSize: 22,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Enjoy your a whole new experience\n in this beautiful world',
              style: blackTextStyle.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            CustomButton(
              text: 'View My Booking',
              onTap: () {
                navigation.setIndexPage = 1;
                Get.offAllNamed('/dashboard');
              },
              width: 210,
            )
          ],
        ),
      ),
    );
  }
}
