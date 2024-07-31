import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class ActivityItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  const ActivityItem({super.key, required this.imgUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
            imageUrl: imgUrl,
            width: 90,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          name,
          style: blackTextStyle.copyWith(
            fontSize: 12,
            fontWeight: medium,
          ),
        ),
      ],
    );
  }
}
