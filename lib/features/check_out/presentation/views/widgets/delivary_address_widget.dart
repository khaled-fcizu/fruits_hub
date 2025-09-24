import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/core/utils/app_assets.dart';

class DelivaryAddressWidget extends StatelessWidget {
  const DelivaryAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 2.h),
      decoration: BoxDecoration(
        color: AppColors.babyBlue,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('عنوان التوصيل', style: AppTextStyles.font13BlackBold),
              Row(
                children: [
                  Icon(Icons.edit_outlined, size: 16.sp),
                  horizontalSpace(4),
                  Text('تعديل', style: AppTextStyles.font13GraySimiBold),
                ],
              ),
            ],
          ),
          verticalSpace(8),
          Row(
            children: [
              SvgPicture.asset(Assets.assetsSvgsLocation),
              horizontalSpace(8),
              Text(
                'شارع النيل، مبنى رقم ١٢٣',
                style: AppTextStyles.font16GrayRegular,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
