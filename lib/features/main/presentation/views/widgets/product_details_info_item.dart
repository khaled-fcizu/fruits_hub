import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';

class ProductDetailsInfoItem extends StatelessWidget {
  const ProductDetailsInfoItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });
  final String title;
  final String subTitle;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 163.w,
      // height: 80.h,
      padding: EdgeInsetsGeometry.only(
        left: 36.5.w,
        right: 28.5.w,
        top: 12.h,
        bottom: 12.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Color(0xffF1F1F5), width: 1.2.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.font16LightGreenBold),
              verticalSpace(4),
              Text(subTitle, style: AppTextStyles.font13GraySimiBold),
            ],
          ),
          horizontalSpace(16),
          Image.asset(image, width: 31.w, height: 31.h),
        ],
      ),
    );
  }
}
