import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/pages/widgets/transaction_item.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        children: [
          // Header (image profile, title, booking count)
          header(),
          // Transaction List
          transaction('Today'),
        ],
      ),
    );
  }

  Widget header() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Profile image
          ClipOval(
            child: Image.asset(
              'assets/images/img_profile.png',
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
          // Title
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'My Booking',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: bold,
                ),
              ),
              const SizedBox(height: 2),
              Text('3 Transactions', style: grayTextStyle)
            ],
          )
        ],
      ),
    );
  }

  Widget transaction(String dateTime) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(height: 10),
          // Transaction item
          const TransactionItem(
            imgUrl: 'assets/images/img_hotel_1.png',
            name: 'Round O\' Park',
            dateTime: '2 Aug 2022',
          ),
        ],
      ),
    );
  }
}
