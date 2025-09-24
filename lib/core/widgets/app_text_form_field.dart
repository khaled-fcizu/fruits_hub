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
    this.onChanged,
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
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.lighterGray, width: 1),
        ),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.lighterGray, width: 1),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.lighterGray, width: 1),
            ),
        errorBorder:
            errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
        focusedErrorBorder:
            focusedErrorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
        hintText: hintText,
        hintStyle: hintStyle ?? AppTextStyles.font13LightGrayBold,
        enabled: true,
        fillColor: fillColor ?? AppColors.morelighterGray,
        filled: true,
      ),
      obscureText: obscureText ?? false,
      validator: (value) => validator(value),
      style: inputTextStyle ?? AppTextStyles.font13GraySimiBold,
    );
  }
}
