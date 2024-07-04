import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class ActivityItem extends StatelessWidget {
  final String text;
  final String imgUrl;
  const ActivityItem({super.key, required this.text, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imgUrl,
              width: 90,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            text,
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
