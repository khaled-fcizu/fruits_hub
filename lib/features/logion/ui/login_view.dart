import 'package:flutter/material.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("This Login Screen", style: AppTextStyles.font23LightOrangeBold,),
      ),
    );
  }
}