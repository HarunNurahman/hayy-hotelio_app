import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class RewardPage extends StatelessWidget {
  const RewardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/ic_maintenance.png', width: 84),
            const SizedBox(height: 30),
            Text(
              'Coming Soon',
              style: blackTextStyle.copyWith(
                fontSize: 22,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'We are developing this page\nfor new great features',
              style: blackTextStyle.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
