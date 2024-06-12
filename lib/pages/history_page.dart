import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/pages/widgets/transaction_item.dart';
import 'package:hayy_hotelio_app/shared/style.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        children: [
          header(),
          latestTransaction(),
          previousTransaction(),
        ],
      ),
    );
  }

  Widget header() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Profile image
          Container(
            width: 55,
            height: 55,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/img_profile.png'),
              ),
            ),
          ),
          // Nearby hotel(s)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'My Booking',
                style: blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
              ),
              const SizedBox(height: 4),
              Text(
                '3 Transaction(s)',
                style: grayTextStyle,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget latestTransaction() {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest Transaction',
            style: blackTextStyle.copyWith(fontWeight: semiBold),
          ),
          const SizedBox(height: 10),
          TransactionItem(
            imgUrl: 'assets/images/img_hotel_1.png',
            name: 'Round O\' Park',
            date: DateTime.now().toIso8601String(),
            isPaid: true,
          )
        ],
      ),
    );
  }

  Widget previousTransaction() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '3 May',
            style: blackTextStyle.copyWith(fontWeight: semiBold),
          ),
          const SizedBox(height: 10),
          TransactionItem(
            imgUrl: 'assets/images/img_hotel_2.png',
            name: 'Silverstone',
            date: DateTime.now().toIso8601String(),
            isPaid: true,
          ),
          TransactionItem(
            imgUrl: 'assets/images/img_hotel_3.png',
            name: 'Angga Nest',
            date: DateTime.now().toIso8601String(),
            isPaid: false,
          ),
        ],
      ),
    );
  }
}
