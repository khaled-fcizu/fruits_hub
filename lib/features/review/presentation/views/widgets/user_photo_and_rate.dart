import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/core/utils/app_assets.dart';

class UserPhotoAndRate extends StatelessWidget {
  const UserPhotoAndRate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 27.r,
          backgroundImage: const AssetImage(
            Assets.assetsImagesProfileImage,
          ),
        ),
        Positioned(
          bottom: 4,
          right: 0,
          left: 40,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.lighterOrange,
                  spreadRadius: 0,
                  blurRadius: 9,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
              color: AppColors.lighterOrange,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: Text(
                  '5.0',
                  style: AppTextStyles.font11MainGreenSimiBold.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
