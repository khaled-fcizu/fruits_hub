import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/featured_item.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          5,
          (index) => Padding(
            padding: EdgeInsets.only(right: index == 0 ? 0 : 12.w),
            child: const FeaturedItem(),
          ),
        ),
      ),
    );
  }
}
