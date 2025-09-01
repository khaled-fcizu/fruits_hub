import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/font_weight_helper.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';

abstract class AppTextStyles {
  static TextStyle font13GraySimiBold = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.gray,
  );
  static TextStyle font13GrayRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.gray,
  );
  static TextStyle font23BlackGrayBold = TextStyle(
    fontSize: 23.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.darkGray,
  );
  static TextStyle font23LightOrangeBold = TextStyle(
    fontSize: 23.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.lightOrange,
  );
  static TextStyle font23MainGreenBold = TextStyle(
    fontSize: 23.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColors.mainGreen,
  );
  static TextStyle font18WhiteSimiBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.white,
  );
}
