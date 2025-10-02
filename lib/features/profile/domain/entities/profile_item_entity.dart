import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/core/utils/app_assets.dart';

class ProfileItemEntity {
  final String title;
  final String prefixIcon;
  final Widget suffixWidget;
  ProfileItemEntity({
    required this.prefixIcon,
    required this.suffixWidget,
    required this.title,
  });

  static List<ProfileItemEntity> profileItems = [
    ProfileItemEntity(
      prefixIcon: Assets.assetsSvgsUser,
      suffixWidget: SvgPicture.asset(Assets.assetsSvgsArrowRight),
      title: 'الملف الشخصي',
    ),
    ProfileItemEntity(
      prefixIcon: Assets.assetsSvgsBox,
      suffixWidget: SvgPicture.asset(Assets.assetsSvgsArrowRight),
      title: 'طلباتي',
    ),
    ProfileItemEntity(
      prefixIcon: Assets.assetsSvgsEmptyWallet,
      suffixWidget: SvgPicture.asset(Assets.assetsSvgsArrowRight),
      title: 'المدفوعات',
    ),
    ProfileItemEntity(
      prefixIcon: Assets.assetsSvgsHeart,
      suffixWidget: SvgPicture.asset(Assets.assetsSvgsArrowRight),
      title: 'المفضلة',
    ),
    ProfileItemEntity(
      prefixIcon: Assets.assetsSvgsNotificationRing,
      suffixWidget: Transform.scale(
        scale: 0.7,
        child: Padding(
          padding: const EdgeInsets.only(left: 2.5),
          child: SizedBox(
            height: 17.h,
            width: 32.w,
            child: Expanded(
              child: Switch(
                value: true,
                onChanged: (value) {},
                padding: EdgeInsetsGeometry.zero,
              ),
            ),
          ),
        ),
      ),
      title: 'الاشعارات',
    ),
    ProfileItemEntity(
      prefixIcon: Assets.assetsSvgsGlobal,
      suffixWidget: Row(
        children: [
          Text('العربية', style: AppTextStyles.font13BlackSemiBold),
          horizontalSpace(2),
          SvgPicture.asset(Assets.assetsSvgsArrowRight),
        ],
      ),
      title: 'اللغة',
    ),
    ProfileItemEntity(
      prefixIcon: Assets.assetsSvgsMagicpen,
      suffixWidget: Transform.scale(
        scale: 0.7,
        child: Padding(
          padding: const EdgeInsets.only(left: 2.5),
          child: SizedBox(
            height: 17.h,
            width: 32.w,
            child: Expanded(
              child: Switch(
                value: true,
                onChanged: (value) {},
                padding: EdgeInsetsGeometry.zero,
              ),
            ),
          ),
        ),
      ),
      title: 'الوضع',
    ),
  ];
}
