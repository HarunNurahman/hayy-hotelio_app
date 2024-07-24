import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class TransactionItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String dateTime;
  final bool isPaid;

  const TransactionItem({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.dateTime,
    this.isPaid = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
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
          // Nama hotel dan status booking
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(dateTime, style: blackTextStyle)
              ],
            ),
          ),
          // Payment status
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: isPaid ? darkGrayColor : redColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              isPaid ? 'PAID' : 'CANCELLED',
              style: whiteTextStyle.copyWith(
                fontSize: 10,
                fontWeight: semiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
