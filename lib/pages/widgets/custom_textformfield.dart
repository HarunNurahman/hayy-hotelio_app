import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/shared/styles.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final bool isObsecure;
  final String hintText;
  final TextInputType textInputType;
  final bool isSearchOn;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final String? errorMessage;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? onFieldSubmitted;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.isObsecure = false,
    this.textInputType = TextInputType.text,
    required this.hintText,
    this.isSearchOn = false,
    this.onTap,
    this.validator,
    this.errorMessage,
    this.onChanged,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
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
        errorText: errorMessage,
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
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: redColor),
        ),
        suffixIcon: isSearchOn
            ? GestureDetector(
                onTap: onTap,
                child: Image.asset('assets/icons/ic_search.png', width: 50),
              )
            : null,
      ),
    );
  }
}
