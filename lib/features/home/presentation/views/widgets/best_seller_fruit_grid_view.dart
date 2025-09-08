import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/widgets/fruit_item.dart';

class BestSellerFruitGridView extends StatelessWidget {
  const BestSellerFruitGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.h,
          crossAxisSpacing: 16.w,
          childAspectRatio: 163 / 214,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return FruitItem();
        },
      ),
    );
  }
}
