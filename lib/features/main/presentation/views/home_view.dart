import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/best_seller_and_more_texts.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/featured_list_view.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/fruits_grid_view.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/home_app_bar.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/main_search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                HomeAppBar(),
                verticalSpace(16),
                MainSearchBar(),
                verticalSpace(12),
                FeaturedListView(),
                verticalSpace(12),
                BestSellerAndMoreTexts(),
                verticalSpace(8),
              ],
            ),
          ),
          ProductsGridView(),
        ],
      ),
    );
  }
}
