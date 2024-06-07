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
      children: [
        Container(
          margin: const EdgeInsets.only(right: 16),
          width: 90,
          height: 70,
          decoration: BoxDecoration(
            color: greenColor,
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(imgUrl),
            ),
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
