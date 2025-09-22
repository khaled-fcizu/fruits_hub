import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.isSelected,
    required this.title,
    required this.subtitle,
    required this.price,required this.onTap,
  });
  final bool isSelected;
  final String title, subtitle, price;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        padding: EdgeInsets.only(left: 13.w, right: 2.w, top: 16.h, bottom: 16.h),
        decoration: BoxDecoration(
          borderRadius: isSelected ? BorderRadius.circular(4.r) : null,
          color: AppColors.babyBlue,
          border: isSelected
              ? Border.all(color: AppColors.mainGreen, width: 1.w)
              : null,
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 18.w,
                height: 18.h,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.mainGreen : Colors.transparent,
                  shape: BoxShape.circle,
                  border: isSelected
                      ? Border.all(color: Colors.white, width: 4.w)
                      : Border.all(color: Colors.grey, width: 1.w),
                ),
              ),
              horizontalSpace(10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.font13BlackSemiBold),
                  verticalSpace(6),
                  Text(subtitle, style: AppTextStyles.font13GrayRegular),
                ],
              ),
              const Spacer(),
              Center(
                child: Text(
                  price,
                  style: AppTextStyles.font13MainGreenBold.copyWith(
                    color: AppColors.mainLightGreen,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
