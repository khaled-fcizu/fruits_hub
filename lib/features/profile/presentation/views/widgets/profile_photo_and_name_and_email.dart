import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helpers/get_user_data.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/core/utils/app_assets.dart';

class ProfilePhotoAndNameAndEmail extends StatelessWidget {
  const ProfilePhotoAndNameAndEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 36.5.r,
              backgroundImage: const AssetImage(
                Assets.assetsImagesProfileImage,
              ),
            ),
            Positioned(
              bottom: -15,
              right: 0,
              left: 0,
              child: CircleAvatar(
                radius: 16.r,
                backgroundColor: Colors.white,
                child: SvgPicture.asset(
                  Assets.assetsSvgsCamera,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
            ),
          ],
        ),
        horizontalSpace(24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(getUserData().name, style: AppTextStyles.font16BlackSimiBold),
            verticalSpace(4),
            Text(
              FirebaseAuth.instance.currentUser!.email!,
              style: AppTextStyles.font13GraySimiBold,
            ),
          ],
        ),
      ],
    );
  }
}
