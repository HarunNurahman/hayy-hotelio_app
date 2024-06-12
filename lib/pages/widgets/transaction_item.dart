import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/shared/style.dart';

import '../../shared/shared_method.dart';

class TransactionItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String date;
  final bool isPaid;
  const TransactionItem({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.date,
    this.isPaid = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
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
                Text(
                  AppFormat.date(date),
                  style: grayTextStyle,
                ),
              ],
            ),
          ),
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
          ),
        ],
      ),
    );
  }
}
