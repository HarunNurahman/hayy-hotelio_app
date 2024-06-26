import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class CustomTextFormField extends StatelessWidget {
  final bool isObsecure;
  final String hint;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const CustomTextFormField({
    super.key,
    this.isObsecure = false,
    required this.hint,
    this.keyboardType = TextInputType.text,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isObsecure,
      cursorColor: blackColor,
      style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: whiteColor,
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 14,
        ),
        hintStyle: grayTextStyle.copyWith(
          color: const Color(0xFFC0C0C0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: whiteColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: darkGrayColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: whiteColor),
        ),
      ),
    );
  }
}
