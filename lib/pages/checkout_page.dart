import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_button.dart';
import 'package:hayy_hotelio_app/shared/shared_method.dart';
import 'package:hayy_hotelio_app/shared/style.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        children: [
          // Booked hotel
          bookedHotel(),
          // Booking detail
          bookingDetail(),
          // Payment options
          paymentOption(),
          CustomButton(
            text: 'Proceed to Payment',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget bookedHotel() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Hotel image
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
          // Hotel name
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

  Widget bookingDetail() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
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
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(height: 10),
          bookingItemDetail('Date', 'Mon, 22 January 2022'),
          bookingItemDetail('Guest', '2 Guest(s)'),
          bookingItemDetail('Breakfast', 'Included'),
          bookingItemDetail('Check-in Time', '14:00 WIB'),
          bookingItemDetail('1 Night', AppFormat.currency(299)),
          bookingItemDetail('Service Fee', AppFormat.currency(50)),
          bookingItemDetail('Activities', AppFormat.currency(350)),
          bookingItemDetail(
            'Total Payment',
            AppFormat.currency(699),
            color: darkGrayColor,
          ),
        ],
      ),
    );
  }

  Widget paymentOption() {
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
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              border: Border.all(color: lightGrayColor),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                Image.asset('assets/images/img_mastercard.png', width: 48),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Harun Nurahman',
                      style: blackTextStyle.copyWith(fontWeight: semiBold),
                    ),
                    Text(
                      'Balance \$700',
                      style: grayTextStyle.copyWith(fontSize: 12),
                    )
                  ],
                ),
                const Spacer(),
                Image.asset('assets/icons/ic_verified.png', width: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget bookingItemDetail(String title, String value, {Color? color}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: blackTextStyle.copyWith(fontSize: 16)),
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
