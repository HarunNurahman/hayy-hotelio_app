import 'package:flutter/widgets.dart';
import 'package:hayy_hotelio_app/shared/style.dart';

class FacilityItem extends StatelessWidget {
  final String name;
  final String imgUrl;
  const FacilityItem({
    super.key,
    required this.name,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border.all(
          color: const Color(0xFFF2F2F2),
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imgUrl, width: 24),
          const SizedBox(height: 4),
          Text(
            name,
            style: blackTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );
  }
}
