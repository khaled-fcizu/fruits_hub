import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/best_seller_and_more_texts.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/home_search_bar.dart';

import 'widgets/home_featured_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomScrollView(
            slivers: [SliverToBoxAdapter(
              child: Column(
                children: [
                  HomeAppBar(),
                  verticalSpace(16.h),
                  HomeSearchBar(),
                  verticalSpace(12.h),
                  HomeFeaturedItem(),
                  verticalSpace(12.h),
                  BestSellerAndMoreTexts()
                ],
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
