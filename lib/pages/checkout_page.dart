import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hayy_hotelio_app/controllers/user_controller.dart';
import 'package:hayy_hotelio_app/models/booking_model.dart';
import 'package:hayy_hotelio_app/models/hotel_model.dart';
import 'package:hayy_hotelio_app/pages/widgets/custom_button.dart';
import 'package:hayy_hotelio_app/shared/shared_method.dart';
import 'package:hayy_hotelio_app/shared/style.dart';
import 'package:hayy_hotelio_app/sources/booking_source.dart';

class CheckoutPage extends StatelessWidget {
  CheckoutPage({super.key});

  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    HotelModel hotel = ModalRoute.of(context)!.settings.arguments as HotelModel;

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        children: [
          // Booked hotel
          bookedHotel(hotel),
          // Booking detail
          bookingDetail(hotel),
          // Payment options
          paymentOption(),
          CustomButton(
            text: 'Proceed to Payment',
            onTap: () {
              BookingSource.addBooking(
                userController.data.id!,
                BookingModel(
                  id: '',
                  idHotel: hotel.id!,
                  cover: hotel.cover!,
                  name: hotel.name!,
                  location: hotel.location!,
                  date: AppFormat.date(DateTime.now().toIso8601String()),
                  guest: 1,
                  breakfast: 'Included',
                  checkInTime: '14:00 WIB',
                  night: 1,
                  serviceFee: 15,
                  activity: 20,
                  totalPayment: (hotel.price! * 1) + 15 + 20,
                  status: 'PAID',
                  isDone: false,
                ),
              );
              Get.toNamed('/checkout-success', arguments: hotel);
            },
          ),
        ],
      ),
    );
  }

  Widget bookedHotel(HotelModel hotel) {
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
              hotel.cover!,
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
                  hotel.name!,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(hotel.location!, style: grayTextStyle),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget bookingDetail(HotelModel hotel) {
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
            AppFormat.date(DateTime.now().toIso8601String()),
          ),
          bookingItemDetail('Guest', '1 Guest(s)'),
          bookingItemDetail('Breakfast', 'Included'),
          bookingItemDetail('Check-in Time', '14:00 WIB'),
          bookingItemDetail('Duration', '1 Night'),
          bookingItemDetail('Service Fee', AppFormat.currency(15)),
          bookingItemDetail('Activities', AppFormat.currency(20)),
          bookingItemDetail(
            'Total Payment',
            AppFormat.currency(hotel.price! + 15 + 20),
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
