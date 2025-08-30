import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helpers/extentions.dart';
import 'package:fruit_hub/core/routing/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      context.pushReplacementNamed(Routes.onBoardingView);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: SvgPicture.asset('assets/svgs/plant.svg'),
            ),
            SvgPicture.asset('assets/svgs/fruit_hub_middle_logo.svg'),
            SvgPicture.asset('assets/svgs/bottom_splash.svg', fit: BoxFit.fill),
          ],
        ),
      ),
    );
  }
}
