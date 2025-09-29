import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/core/utils/app_assets.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.widget});
 final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.assetsSvgsUser, width: 20.w, height: 20.h),
        horizontalSpace(7),
        Text('الملف الشخصي', style: AppTextStyles.font13GraySimiBold,),
        Spacer(),
        widget,
      ],
    );
  }
}
