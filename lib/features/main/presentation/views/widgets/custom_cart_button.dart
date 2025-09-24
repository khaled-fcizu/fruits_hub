import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helpers/extentions.dart';
import 'package:fruit_hub/core/routing/routes.dart';
import 'package:fruit_hub/core/widgets/app_text_button.dart';
import 'package:fruit_hub/features/main/presentation/managers/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/main/presentation/managers/cart_item_cubit/cart_item_cubit.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return AppButton(
          onPressed: () {
            if (context.read<CartCubit>().cartEntity.cartItemsList.isNotEmpty) {
              context.pushNamed(
                Routes.checkOutView,
                arguments: context.read<CartCubit>().cartEntity,
              );
            } else {
              context.showSnackBar('لا يوجد منتجات في السلة');
            }
          },
          buttonText:
              'الدفع ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} جنيه',
        );
      },
    );
  }
}
