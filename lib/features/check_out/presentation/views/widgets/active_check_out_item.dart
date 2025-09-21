import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/core/utils/app_assets.dart';

class ActiveCheckOutItem extends StatelessWidget {
  const ActiveCheckOutItem({super.key, required this.text});
 final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 11.5.r,
          backgroundColor: AppColors.mainGreen,
          child: SvgPicture.asset(Assets.assetsSvgsTrue),
        ),
        horizontalSpace(4),
        Text(
          text,
          style: AppTextStyles.font13GraySimiBold
        ),
      ],
    );
  }
}
