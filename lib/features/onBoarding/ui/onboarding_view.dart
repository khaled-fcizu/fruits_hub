import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/extentions.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/routing/routes.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/utils/constants.dart';
import 'package:fruit_hub/core/service/shared_prefrance_sigleton.dart';
import 'package:fruit_hub/core/widgets/app_text_button.dart';
import 'package:fruit_hub/features/onBoarding/ui/widgets/onboarding_page_view.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int currentPage = 0;
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: OnBoardingPageView(pageController: pageController)),
            DotsIndicator(
              dotsCount: 2,
              decorator: DotsDecorator(
                color: currentPage == 1
                    ? AppColors.mainGreen
                    : AppColors.mainGreen.withOpacity(0.5),
                activeColor: AppColors.mainGreen,
              ),
            ),
            verticalSpace(16),
            Visibility(
              visible: currentPage == 1 ? true : false,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: AppButton(
                  onPressed: () {
                    SharedPrefranceSigleton.setBool(
                      key: isOnBoardingViewSeen,
                      value: true,
                    );
                    context.pushNamed(Routes.loginView);
                  },
                  buttonText: 'ابدأ الان',
                ),
              ),
            ),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
