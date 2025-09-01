import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/widgets/app_text_button.dart';
import 'package:fruit_hub/features/onBoarding/ui/widgets/onboarding_page_view.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: OnBoardingPageView()),
            DotsIndicator(dotsCount: 2),
            verticalSpace(16),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: AppButton(onPressed: (){}, buttonText: 'ابدأ الان'),
            ),
            verticalSpace(20),

          ],
        ),
      ),
    );
  }
}
