import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';

class CondationsAndTermsChick extends StatelessWidget {
  const CondationsAndTermsChick({super.key, required this.confermeIcon});
  final Widget confermeIcon;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        confermeIcon,
        horizontalSpace(16),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: AppTextStyles.font13GraySimiBold,
                ),
                TextSpan(
                  text: 'الشروط والاحكام الخاصه بنا',
                  style: AppTextStyles.font13LightGreenSimiBold,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
