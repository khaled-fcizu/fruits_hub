import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/utils/app_assets.dart';
import 'package:fruit_hub/core/widgets/app_text_button.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/product_details_infos.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/product_details_view_arrow_back.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/product_name_and_price_and_action_button.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/product_rating_and_review_and_description.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: SvgPicture.asset(
                      Assets.assetsSvgsProductDetailsGreyContainer,
                      fit: BoxFit.fill,
                    ),
                  ),
                  ProductDetailsViewArrowBack(),
                  Positioned(
                    bottom: 70.h,
                    right: 0,
                    left: 0,
                    child: CachedNetworkImage(
                      height: 167.h,
                      width: 221.w,
                      imageUrl: productEntity.imageUrl!,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ],
              ),
              verticalSpace(24),
              ProductNameAndPriceAndActionButton(productEntity: productEntity,),
              verticalSpace(8),
              ProductRatingAndReview(productEntity: productEntity,),
              verticalSpace(16),
              ProductDetailsInfos(productEntity: productEntity,),
              verticalSpace(24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: AppButton(onPressed: () {}, buttonText: 'أضف الي السلة'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
