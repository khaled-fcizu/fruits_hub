import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

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
