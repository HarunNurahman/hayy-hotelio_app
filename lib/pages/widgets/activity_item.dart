import 'package:flutter/widgets.dart';
import 'package:hayy_hotelio_app/shared/style.dart';

class ActivityItem extends StatelessWidget {
  final String name;
  final String imgUrl;
  const ActivityItem({
    super.key,
    required this.name,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            imgUrl,
            width: 90,
            height: 70,
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
