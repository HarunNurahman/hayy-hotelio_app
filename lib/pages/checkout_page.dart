import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_button.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(title: const Text('Checkout')),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: CustomButton(
          onPressed: () => Navigator.pushNamed(context, '/checkout-success'),
          text: 'Proceed to Payment',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          // Hotel info
          hotelInfo(),
          // Checkout detail
          checkoutDetail(),
          // Payment Method
          paymentMethod(),
        ],
      ),
    );
  }

  Widget hotelInfo() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Hotel cover
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/img_hotel_1.png',
              width: 90,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          // Hotel name & location
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Round O\' Park',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(height: 4),
              Text('Jakarta, Indonesia', style: grayTextStyle),
            ],
          )
        ],
      ),
    );
  }

  Widget checkoutDetail() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Room Detail',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 10),
          checkoutDetailItem('Date', 'Mon, 1 Jul 2024'),
          checkoutDetailItem('Guest', '1 Person'),
          checkoutDetailItem('Breakfast', 'Included'),
          checkoutDetailItem('Check-in Time', '14:00 WIB'),
          checkoutDetailItem('Duration', '1 Night'),
          checkoutDetailItem('Service Fee', '\$15'),
          checkoutDetailItem('Activity', '\$25'),
          const Divider(thickness: 1),
          const SizedBox(height: 10),
          checkoutDetailItem(
            'Total Payment',
            '\$100',
            color: darkGrayColor,
          ),
        ],
      ),
    );
  }

  Widget paymentMethod() {
    return Container(
      margin: const EdgeInsets.only(top: 24, bottom: 100),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Method',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          // Payment method
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 14,
            ),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(width: 2, color: lightGrayColor),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/img_mastercard.png',
                  height: 30,
                ),
                const SizedBox(width: 16),
                // Payment information
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Card owner
                      Text(
                        'Elliot York Owell',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      // Balance
                      Text(
                        'Balance \$80,000',
                        style: grayTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
                // Verified icon
                Image.asset('assets/icons/ic_verified.png', width: 20),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget checkoutDetailItem(
    String title,
    String value, {
    Color color = Colors.black,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(fontSize: 16),
          ),
          Text(
            value,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
              color: color,
            ),
          )
        ],
      ),
    );
  }
}
