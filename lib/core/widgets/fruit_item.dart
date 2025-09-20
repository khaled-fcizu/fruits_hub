import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/features/main/presentation/managers/cart_cubit/cart_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(decoration: BoxDecoration(color: AppColors.babyBlue)),
        Positioned(
          top: 17,
          left: 20,
          child: CachedNetworkImage(
            imageUrl: productEntity.imageUrl!,
            height: 100.h,
            width: 100.w,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Skeletonizer(
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    color: Colors.indigo,
                  ),
                ),
          ),
        ),
        Positioned(
          bottom: 16,
          left: 0,
          right: 7.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productEntity.productName,
                style: AppTextStyles.font13GraySimiBold.copyWith(
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 4.h),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${productEntity.price}جنية',
                      style: AppTextStyles.font13LightGreenBold.copyWith(
                        color: Colors.orange,
                      ),
                    ),
                    TextSpan(
                      text: ' / الكيلو',
                      style: AppTextStyles.font13GraySimiBold.copyWith(
                        color: Colors.orange[300],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 100,
          bottom: 16,
          left: 0,
          child: GestureDetector(
            onTap: () => context.read<CartCubit>().addProduct(productEntity),
            child: SvgPicture.asset('assets/svgs/add_to_cart_button.svg'),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: SvgPicture.asset('assets/svgs/heart.svg'),
        ),
      ],
    );
  }
}
