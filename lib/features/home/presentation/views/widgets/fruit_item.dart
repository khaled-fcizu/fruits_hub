import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 163.w,
          height: 214.h,
          decoration: BoxDecoration(color: AppColors.babyBlue),
        ),
        Positioned(
          top: 17,
          left: 20,
          child: Image.asset(
            'assets/images/fruit_test.png',
            width: 114.w,
            height: 105.h,
          ),
        ),
        Positioned(
          bottom: 16,
          left: 0,
          right: 7.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'فراولة',
                style: AppTextStyles.font13GraySimiBold.copyWith(
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 4.h),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '30جنية',
                      style: AppTextStyles.font13LightGreenBold.copyWith(
                        color: Colors.orange,
                      ),
                    ),
                    TextSpan(
                      text: ' / الكيلو',
                      style: AppTextStyles.font13GraySimiBold.copyWith(
                        color: Colors.orange[300],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 100,
          bottom: 16,
          left: 0,
          child: SvgPicture.asset('assets/svgs/add_to_cart_button.svg'),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: SvgPicture.asset('assets/svgs/heart.svg'),
        ),
      ],
    );
  }
}
