import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/helpers/extentions.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/routing/routes.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/core/utils/constants.dart';
import 'package:fruit_hub/core/service/shared_prefrance_sigleton.dart';

class OnBoardingPageViewItem extends StatelessWidget {
  const OnBoardingPageViewItem({
    super.key,
    required this.isVisible,
    required this.backgroungImage,
    required this.image,
    required this.subTitile,
    required this.title,
  });
  final bool isVisible;
  final String image, backgroungImage;
  final String subTitile;
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: SvgPicture.asset(backgroungImage, fit: BoxFit.fill),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: SvgPicture.asset(image),
            ),
            Visibility(
              visible: isVisible,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: (){
                    SharedPrefranceSigleton.setBool(key: isOnBoardingViewSeen, value: true);
                    context.pushNamed(Routes.loginView);
                  },
                  child: Text('تخط', style: AppTextStyles.font13GrayRegular,)),
              ),
            ),
          ],
        ),
        verticalSpace(34),
        title,
        verticalSpace(24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.w),
          child: Text(
            subTitile,
            textAlign: TextAlign.center,
            style: AppTextStyles.font13GraySimiBold,
          ),
        ),
      ],
    );
  }
}
