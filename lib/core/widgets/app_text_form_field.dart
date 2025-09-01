
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    required this.hintText,
    this.obscureText,
    this.hintStyle,
    this.inputTextStyle,
    this.suffixIcon,
    this.contentPadding,
    this.fillColor,
    this.controller,
    required this.validator,
  });
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final String hintText;
  final bool? obscureText;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey, width: 1.3),
        ),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.blue, width: 1.3),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.3,
              ),
            ),
        errorBorder:
            errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.red, width: 1.3),
            ),
        focusedErrorBorder:
            focusedErrorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.red, width: 1.3),
            ),
        hintText: hintText,
        hintStyle: hintStyle ?? AppTextStyles.font13GraySimiBold,
        enabled: true,
        fillColor: fillColor ?? AppColors.gray,
        filled: true,
      ),
      obscureText: obscureText ?? false,
      validator: (value) => validator(value),
      style: inputTextStyle ?? AppTextStyles.font13GraySimiBold,
    );
  }
}
