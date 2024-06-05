import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/shared/style.dart';

class CategoryItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;
  const CategoryItem({
    super.key,
    required this.text,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? greenColor : whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: blackTextStyle.copyWith(
              fontWeight: isSelected ? semiBold : medium,
            ),
          ),
        ),
      ),
    );
  }
}
