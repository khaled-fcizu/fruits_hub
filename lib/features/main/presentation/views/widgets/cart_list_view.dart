import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/widgets/custom_divider.dart';
import 'package:fruit_hub/features/main/presentation/managers/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/cart_product_item.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) {
        return CustomDivider();
      },
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CartProductItem(
          cartItemEntity: context
              .read<CartCubit>()
              .cartEntity
              .cartItemsList[index],
        ),
      ),
      itemCount: context.watch<CartCubit>().cartEntity.cartItemsList.length,
    );
  }
}

