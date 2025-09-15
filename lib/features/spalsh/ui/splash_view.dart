import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helpers/extentions.dart';
import 'package:fruit_hub/core/routing/routes.dart';
import 'package:fruit_hub/core/service/firebase_auth_service.dart';
import 'package:fruit_hub/core/utils/constants.dart';
import 'package:fruit_hub/core/service/shared_prefrance_sigleton.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    excuteNavigation();
    super.initState();
  }

  void excuteNavigation() {
    Future.delayed(Duration(seconds: 3), () {
      if (SharedPrefranceSigleton.getBool(key: isOnBoardingViewSeen)) {
        var isLoggedin = FirebaseAuthService().isLoggedIn();
        if (isLoggedin) {
          context.pushNamed(Routes.mainView);
        } else {
          context.pushReplacementNamed(Routes.loginView);
        }
      } else {
        context.pushReplacementNamed(Routes.onBoardingView);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
    );
  }
}
