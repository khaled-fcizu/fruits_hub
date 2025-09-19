import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';

class ProductsInCartText extends StatelessWidget {
  const ProductsInCartText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 41.h,
      decoration: BoxDecoration(
        color: AppColors.mainLighterGreen,
      ),
      child: Center(
        child: Text(
         'لديك 3 منتجات في سله التسوق',
          style: AppTextStyles.font13MainGreenRegular,
        ),
      ),
    );
  }
}