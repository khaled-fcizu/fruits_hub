import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/core/utils/app_assets.dart';

class ReviewTextField extends StatelessWidget {
  const ReviewTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey[100]!,
            spreadRadius: 0,
            blurRadius: 9,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Color(0xffEEEEEE), width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Color(0xffEEEEEE), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Color(0xffEEEEEE), width: 1),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 17.w, right: 14.73.w),
            child: CircleAvatar(
              radius: 15.r,
              backgroundImage: AssetImage(Assets.assetsImagesUserImage),
            ),
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 30.w, // أصغر عرض للأيقونة
            minHeight: 30.h, // أصغر ارتفاع
          ),
          hintText: 'اكتب التعليق..',
          hintStyle: AppTextStyles.font13BlackSemiBold,
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
