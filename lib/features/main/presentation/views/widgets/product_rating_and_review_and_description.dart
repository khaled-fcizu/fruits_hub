import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/core/utils/app_assets.dart';

class ProductRatingAndReview extends StatelessWidget {
  const ProductRatingAndReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 20.w),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.assetsSvgsStar),
              horizontalSpace(9),
              Text('4.8', style: AppTextStyles.font13BlackSemiBold),
              horizontalSpace(9),
              Text(
                '(30+)',
                style: AppTextStyles.font13GrayRegular.copyWith(fontSize: 14),
              ),
              horizontalSpace(9),
              Text(
                'المراجعه',
                style: AppTextStyles.font13MainGreenBold.copyWith(
                  decoration: TextDecoration.underline,
                  decorationThickness: 1,
                ),
              ),
            ],
          ),
          horizontalSpace(8),
          Text(
            'ينتمي إلى الفصيلة القرعية ولثمرته لُب حلو المذاق وقابل للأكل، وبحسب علم النبات فهي تعتبر ثمار لبيّة، تستعمل لفظة البطيخ للإشارة إلى النبات نفسه أو إلى الثمرة تحديداً',
            style: AppTextStyles.font13GrayRegular,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
