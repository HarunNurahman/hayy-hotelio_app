import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/models/booking_model.dart';
import 'package:hayy_hotelio_app/shared/style.dart';

import '../../shared/shared_method.dart';

class TransactionItem extends StatelessWidget {
  // final String imgUrl;
  // final String name;
  // final String date;
  final bool isPaid;
  final BookingModel booking;
  const TransactionItem({
    super.key,
    // required this.imgUrl,
    // required this.name,
    // required this.date,
    required this.booking,
    this.isPaid = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
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
                Text(
                  AppFormat.date(booking.date!),
                  style: grayTextStyle,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: booking.status == 'PAID' ? darkGrayColor : redColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                booking.status!,
                style: whiteTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: semiBold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
