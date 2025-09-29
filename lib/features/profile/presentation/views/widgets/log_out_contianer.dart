import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/core/utils/app_assets.dart';

class LogOutContainer extends StatelessWidget {
  const LogOutContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 11.5.h),
      decoration: BoxDecoration(color: Color(0xffEBF9F1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 2),
          Text('تسجيل الخروج', style: AppTextStyles.font13MainGreenSimiBold),
          Spacer(flex: 1),
          SvgPicture.asset(Assets.assetsSvgsLogOut),
          Spacer(),
        ],
      ),
    );
  }
}
