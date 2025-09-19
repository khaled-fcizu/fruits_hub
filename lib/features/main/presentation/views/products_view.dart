import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/best_seller_and_more_texts.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/fruits_grid_view_bloc_builder.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/main_search_bar.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/our_products_and_filter_icon.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/product_list_view.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, isLeadingVisible: false, title: 'المنتجات'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  verticalSpace(16),
                  MainSearchBar(),
                  verticalSpace(16),
                  OurProductsAndFilterIcon(),
                  verticalSpace(8),
                  ProductListView(),
                  verticalSpace(24),
                  BestSellerAndMoreTexts(),
                  verticalSpace(8),
                ],
              ),
            ),
            FruitsGridViewBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
