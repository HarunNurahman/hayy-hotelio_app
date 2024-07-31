import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class CategoryItem extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isSelected;
  final String text;
  const CategoryItem({
    super.key,
    this.onTap,
    this.isSelected = false,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? greenColor : whiteColor,
        ),
        child: Text(
          text,
          style: blackTextStyle.copyWith(
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}
