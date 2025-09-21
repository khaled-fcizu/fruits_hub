import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';

class InactiveCheckOutItem extends StatelessWidget {
  const InactiveCheckOutItem({
    super.key,
    required this.text,
    required this.index,
  });
  final String text;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 10.r,
          backgroundColor: AppColors.lighterGray,
          child: Text(
            index.toString(),
            style: AppTextStyles.font13BlackSemiBold,
          ),
        ),
        horizontalSpace(4),
        Text(
          text,
          style: AppTextStyles.font13LighterGraySimiBold.copyWith(
            color: Color(0xffAAAAAA),
          ),
        ),
      ],
    );
  }
}
