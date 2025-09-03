import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';

class LoginOptionsItem extends StatelessWidget {
  const LoginOptionsItem({super.key, required this.onPressed, required this.text, required this.image});
  final void Function()? onPressed;
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child:TextButton(onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16.r),
          side: BorderSide(
            color: AppColors.lighterGray,
            width: 1.3,
          ),
        ),

      ),
       child: ListTile(
        visualDensity: VisualDensity(
          vertical: VisualDensity.minimumDensity,
        ),
        title: Text(text,style: AppTextStyles.font16BlackSimiBold,textAlign: TextAlign.center,),
        leading: SvgPicture.asset(image),
       )) ,
    );
  }
}