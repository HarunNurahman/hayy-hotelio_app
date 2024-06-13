import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/models/booking_model.dart';
import 'package:hayy_hotelio_app/shared/shared_method.dart';
import 'package:hayy_hotelio_app/shared/style.dart';

class DetailBookingPage extends StatelessWidget {
  const DetailBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    BookingModel booking =
        ModalRoute.of(context)!.settings.arguments as BookingModel;

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Booking')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        children: [
          // Booked hotel
          bookedHotel(booking),
          // Booking detail
          bookingDetail(booking),
          // Payment options
          paymentOption(),
        ],
      ),
    );
  }

  Widget bookedHotel(BookingModel booking) {
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
            child: Image.network(
              booking.cover!,
              width: 90,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          // Hotel name
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  booking.name!,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(booking.location!, style: grayTextStyle),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget bookingDetail(BookingModel booking) {
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
          bookingItemDetail(
            'Date',
            booking.date!,
          ),
          bookingItemDetail('Guest', booking.guest.toString()),
          bookingItemDetail('Breakfast', booking.breakfast!),
          bookingItemDetail('Check-in Time', booking.checkInTime!),
          bookingItemDetail('Duration', '${booking.night.toString()} Night(s)'),
          bookingItemDetail(
              'Service Fee', AppFormat.currency(booking.serviceFee!)),
          bookingItemDetail(
              'Activities', AppFormat.currency(booking.activity!)),
          bookingItemDetail(
            'Total Payment',
            AppFormat.currency(booking.totalPayment!),
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
