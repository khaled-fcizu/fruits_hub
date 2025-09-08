import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/home_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomScrollView(
            slivers: [SliverToBoxAdapter(child: HomeAppBar())],
          ),
        ),
      ),
    );
  }
}
