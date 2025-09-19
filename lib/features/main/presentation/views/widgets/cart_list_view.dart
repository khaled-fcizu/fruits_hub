import 'package:flutter/material.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/cart_product_item.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) {
        return const Divider(color: Color(0xFFDCDEDE), thickness: 0.4);
      },
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: CartProductItem(),
      ),
      itemCount: 3,
    );
  }
}
