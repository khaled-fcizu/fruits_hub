import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/core/utils/app_assets.dart';

class ProductRatingAndReview extends StatelessWidget {
  const ProductRatingAndReview({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 20.w),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.assetsSvgsStar),
              horizontalSpace(9),
              Text(
                productEntity.avgRating.toString(),
                style: AppTextStyles.font13BlackSemiBold,
              ),
              horizontalSpace(9),
              Text(
                "(${productEntity.totalRatings.toString()})",
                style: AppTextStyles.font13GrayRegular.copyWith(fontSize: 14),
              ),
              horizontalSpace(9),
              Text(
                'المراجعه',
                style: AppTextStyles.font13MainGreenBold.copyWith(
                  decoration: TextDecoration.underline,
                  decorationThickness: 1,
                ),
              ),
            ],
          ),
          horizontalSpace(8),
          Text(
            productEntity.description,
            style: AppTextStyles.font13GrayRegular,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}
