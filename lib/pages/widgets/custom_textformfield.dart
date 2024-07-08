import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final bool isObsecure;
  final String hintText;
  final TextInputType textInputType;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.isObsecure = false,
    this.textInputType = TextInputType.text,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: isObsecure,
      cursorColor: blackColor,
      style: blackTextStyle.copyWith(
        fontSize: 14,
        fontWeight: medium,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: whiteColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 14,
        ),
        hintText: hintText,
        hintStyle: grayTextStyle.copyWith(color: const Color(0xFFC0C0C0)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: darkGrayColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: redColor),
        ),
      ),
    );
  }
}
