import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/core/utils/app_assets.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.babyBlue,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            Assets.assetsImagesAvocadoTest,
            width: 36.w,
            height: 36.h,
          ),
        ),
        verticalSpace(2),
        Text(
          'افوكادو',
          style: AppTextStyles.font13BlackSemiBold,
        ),
      ],
    );
  }
}
