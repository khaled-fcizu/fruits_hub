import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/widgets/app_text_button.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/bottom_navigation_bar/products_in_cart_text.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/cart_list_view.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  buildAppBar(context, title: 'السلة', isRingVisible: false),
                  verticalSpace(16),
                  ProductsInCartText(),
                  verticalSpace(24),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
                child: Divider(color: Color(0xFFDCDEDE), thickness: 0.4),
              ),
            ),
            CartListView(),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
                child: Divider(color: Color(0xFFDCDEDE), thickness: 0.4),
              ),
            ),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 70,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: AppButton(onPressed: () {}, buttonText: 'الدفع  120جنيه'),
          ),
        ),
      ],
    );
  }
}
