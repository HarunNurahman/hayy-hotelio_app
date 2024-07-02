import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class TransactionItem extends StatelessWidget {
  final String imgUrl;
  final String hotelName;
  final String dateTime;
  final bool isPaid;
  const TransactionItem({
    super.key,
    required this.imgUrl,
    required this.hotelName,
    required this.dateTime,
    this.isPaid = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              imgUrl,
              width: 90,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          // Hotel name & booking date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotelName,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(dateTime, style: grayTextStyle),
              ],
            ),
          ),
          // Payment status
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: isPaid ? darkGrayColor : redColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                isPaid ? 'Paid' : 'Cancelled',
                style: whiteTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: semiBold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
