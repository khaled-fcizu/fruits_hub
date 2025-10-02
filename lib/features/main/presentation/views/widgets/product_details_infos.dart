import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/helpers/extentions.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/routing/routes.dart';
import 'package:fruit_hub/core/utils/app_assets.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/product_details_info_item.dart';

class ProductDetailsInfos extends StatelessWidget {
  const ProductDetailsInfos({super.key, required this.productEntity});
  final ProductEntity productEntity;
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
                title: '${productEntity.expirationMonths.toString()} شهر',
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
                title: '${productEntity.numberOfCalories} ك',
                subTitle: '${productEntity.calorieSUnitAmount} جرام',
                image: Assets.assetsImagesCalory,
              ),

              GestureDetector(
                onTap: ()=> context.pushNamed(Routes.reviewView),
                child: ProductDetailsInfoItem(
                  title: productEntity.reviews.length.toString(),
                  subTitle: 'Reviews',
                  image: Assets.assetsImagesReviewStar,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
