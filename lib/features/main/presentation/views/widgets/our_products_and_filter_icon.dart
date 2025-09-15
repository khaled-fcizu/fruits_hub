import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/core/utils/app_assets.dart';

class OurProductsAndFilterIcon extends StatelessWidget {
  const OurProductsAndFilterIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('منتجاتنا', style: AppTextStyles.font16BlackBold),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5.5
          ),
          decoration: BoxDecoration(
            
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: BoxBorder.all(
              width: 1,
              color: Colors.grey.shade300,)
          ),
          child: SvgPicture.asset(Assets.assetsSvgsFilterSwap)),
      ],
    );
  }
}