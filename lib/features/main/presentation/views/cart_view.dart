import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';
import 'package:fruit_hub/core/widgets/custom_divider.dart';
import 'package:fruit_hub/features/main/presentation/managers/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/bottom_navigation_bar/products_in_cart_text.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/cart_list_view.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/custom_cart_button.dart';

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
                  buildAppBar(
                    context,
                    title: 'السلة',
                    isRingVisible: false,
                    isLeadingVisible: false,
                  ),
                  verticalSpace(16),
                  ProductsInCartText(),
                  verticalSpace(24),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
                child:
                    context.watch<CartCubit>().cartEntity.cartItemsList.isEmpty
                    ? const SizedBox.shrink()
                    : CustomDivider(),
              ),
            ),
            CartListView(),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
                child:
                    context.watch<CartCubit>().cartEntity.cartItemsList.isEmpty
                    ? const SizedBox.shrink()
                    : CustomDivider(),
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
            child: CustomCartButton(),
          ),
        ),
      ],
    );
  }
}
