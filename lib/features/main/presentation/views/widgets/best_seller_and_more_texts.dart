import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/extentions.dart';
import 'package:fruit_hub/core/routing/routes.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';

class BestSellerAndMoreTexts extends StatelessWidget {
  const BestSellerAndMoreTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('الاكثر مبيعاً', style: AppTextStyles.font16BlackBold),
        GestureDetector(
          onTap: () {
            context.pushNamed(Routes.bestSellerView);
          },
          child: Text('المزيد', style: AppTextStyles.font13GrayRegular),
        ),
      ],
    );
  }
}
