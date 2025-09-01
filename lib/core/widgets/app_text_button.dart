



import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });
  final Function()? onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.mainGreen),
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 54)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      child: Text(buttonText, style: AppTextStyles.font18WhiteSimiBold),
    );
  }
}
