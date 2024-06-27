import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class FacilityItem extends StatelessWidget {
  final String title;
  final String imgUrl;
  const FacilityItem({super.key, required this.title, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFFF2F2F2),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imgUrl,
            width: 24,
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
          )
        ],
      ),
    );
  }
}
