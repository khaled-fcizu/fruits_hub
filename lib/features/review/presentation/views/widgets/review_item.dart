import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/features/review/presentation/views/widgets/user_photo_and_rate.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Ahmed Amr', style: AppTextStyles.font16BlackSimiBold),
                Text(
                  '25/06/2020',
                  style: AppTextStyles.font13GrayRegular.copyWith(
                    color: AppColors.lightGray,
                  ),
                ),
              ],
            ),
            horizontalSpace(14.19),
            UserPhotoAndRate(),
          ],
        ),
        verticalSpace(17.24),
        Text(
          'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها',
          style: AppTextStyles.font13GrayRegular.copyWith(
            color: AppColors.lightGray,
          ),
        ),
      ],
    );
  }
}
