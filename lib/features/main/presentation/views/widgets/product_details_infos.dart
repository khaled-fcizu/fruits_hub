import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/utils/app_assets.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/product_details_info_item.dart';

class ProductDetailsInfos extends StatelessWidget {
  const ProductDetailsInfos({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProductDetailsInfoItem(
                title: 'عام',
                subTitle: 'الصلاحيه',
                image: Assets.assetsImagesExpirationCalender,
              ),

              ProductDetailsInfoItem(
                title: '100%',
                subTitle: 'اوجانيك',
                image: Assets.assetsImagesLotus,
              ),
            ],
          ),
          verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProductDetailsInfoItem(
                title: '80 ك',
                subTitle: '100 جرام',
                image: Assets.assetsImagesCalory,
              ),

              ProductDetailsInfoItem(
                title: '4.8',
                subTitle: 'Reviews',
                image: Assets.assetsImagesReviewStar,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
