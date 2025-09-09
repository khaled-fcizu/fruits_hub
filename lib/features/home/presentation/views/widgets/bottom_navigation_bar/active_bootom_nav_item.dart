import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:fruit_hub/core/theming/app_text_styles.dart';

import '../../../../../../core/helpers/spacing_helper.dart' show horizontalSpace;

class ActiveBottomNavItem extends StatelessWidget {
  const ActiveBottomNavItem({
    super.key,
    required this.image,
    required this.text,
  });
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 16.w),
        decoration: ShapeDecoration(
          color: const Color(0xFFEEEEEE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30.w,
              height: 30.h,
              decoration: ShapeDecoration(
                color: const Color(0xFF1B5E37),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Center(child: SvgPicture.asset(image)),
            ),
            horizontalSpace(4),
            Text(text, style: AppTextStyles.font11MainGreenSimiBold),
          ],
        ),
      ),
    );
  }
}
