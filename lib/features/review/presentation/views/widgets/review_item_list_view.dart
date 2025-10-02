import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/features/review/presentation/views/widgets/review_item.dart';

class ReviewItemListView extends StatelessWidget {
  const ReviewItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: ReviewItem(),
        ),
      ),
    );
  }
}
