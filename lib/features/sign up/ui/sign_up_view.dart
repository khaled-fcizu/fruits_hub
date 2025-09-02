import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('THIS IS SIGN UP SCREEN', style: AppTextStyles.font19BlackBold,),
      ),
    );
  }
}