import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/features/auth/ui/widgets/custom_chick_box.dart';

class CondationsAndTermsChick extends StatefulWidget {
  const CondationsAndTermsChick({super.key});

  @override
  State<CondationsAndTermsChick> createState() => _CondationsAndTermsChickState();
}

class _CondationsAndTermsChickState extends State<CondationsAndTermsChick> {
  bool isChicked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomChickBox(isChicked: isChicked, onChicked: (value) { 
          isChicked = value;
          setState(() {
            
          });
         },),
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
