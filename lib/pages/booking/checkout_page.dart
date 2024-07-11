import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_button.dart';
import 'package:hayy_hotelio_app/shared/app_format.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        children: [
          // Hotel information
          hotelInfo(),
          // Room detail
          roomDetail(),
          // Payment
          payment(),
          // Pay button
          CustomButton(
            text: 'Proceed to Payment',
            onPressed: () => Navigator.pushNamed(context, '/checkout-success'),
          )
        ],
      ),
    );
  }

  Widget hotelInfo() {
    return Container(
      width: double.infinity,
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
          // Hotel name and location
          Expanded(
            child: Column(
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
                Text('Jakarta, Indonesia', style: grayTextStyle)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget roomDetail() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Room Details',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          roomItem('Date', 'Mon, 22 Jan 2022'),
          roomItem('Guest', '1 Guest(s)'),
          roomItem('Breakfast', 'Included'),
          roomItem('Check-in Time', '14:00 WIB'),
          roomItem('Duration', '1 Night'),
          roomItem('Service Fee', AppFormat.currency(5)),
          roomItem('Activity', AppFormat.currency(35)),
          const SizedBox(height: 10),
          Divider(height: 1, color: darkGrayColor),
          roomItem(
            'Total Payment',
            AppFormat.currency(119),
            color: darkGrayColor,
          ),
        ],
      ),
    );
  }

  Widget roomItem(String item, String value, {Color? color}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item,
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

  Widget payment() {
    return Container(
      margin: const EdgeInsets.only(top: 24, bottom: 30),
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
          const SizedBox(height: 10),
          // Payment box
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: whiteColor,
              border: Border.all(color: grayColor),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                // Payment method logo
                Image.asset(
                  'assets/images/img_mastercard.png',
                  width: 50,
                ),
                const SizedBox(width: 12),
                // Card owner and balance
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Harun Nurahman',
                        style: blackTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Balance ${AppFormat.currency(5000)}',
                        style: grayTextStyle.copyWith(
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
                // Verified icon
                Image.asset('assets/icons/ic_verified.png', width: 20)
              ],
            ),
          )
        ],
      ),
    );
  }
}
