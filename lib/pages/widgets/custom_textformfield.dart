import 'package:flutter/material.dart';
import 'package:hayy_hotelio_app/shared/style.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final bool obsecureText;
  final bool isSearchOn;
  final TextEditingController? textController;
  final VoidCallback? onTap;
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.isSearchOn = false,
    this.onTap,
    this.textController,
    this.obsecureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      obscureText: obsecureText,
      style: blackTextStyle.copyWith(
        fontSize: 14,
        fontWeight: medium,
      ),
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: grayTextStyle,
        counterText: '',
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 20,
        ),
        filled: true,
        fillColor: whiteColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: whiteColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: darkGrayColor),
        ),
        suffixIcon: isSearchOn
            ? GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/icons/ic_search.png',
                      ),
                    ),
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
