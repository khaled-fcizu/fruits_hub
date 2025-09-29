import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/extentions.dart';

class ProductDetailsViewArrowBack extends StatelessWidget {
  const ProductDetailsViewArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.h),
      child: GestureDetector(
        onTap: () => context.pop(),
        child: CircleAvatar(
          radius: 22.r,
          backgroundColor: Colors.white,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 3),
              child: Icon(Icons.arrow_back_ios, size: 18),
            ),
          ),
        ),
      ),
    );
  }
}
