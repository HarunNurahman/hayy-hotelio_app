import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/shared/style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final VoidCallback onTap;
  const CustomButton({
    super.key,
    required this.text,
    this.width = double.infinity,
    this.height = 50,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: greenColor,
            offset: const Offset(0, 5),
            blurRadius: 15,
          )
        ],
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: greenColor,
          minimumSize: Size(width, height),
          shadowColor: greenColor,
          elevation: 8,
        ),
        child: Text(
          text,
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}
