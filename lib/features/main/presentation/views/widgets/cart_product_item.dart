import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/core/utils/app_assets.dart';
import 'package:fruit_hub/features/main/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub/features/main/presentation/managers/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/main/presentation/managers/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/increament_or_decrement_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == cartItemEntity) return true;
        }
        return false;
      },
      builder: (context, state) {
        return SizedBox(
          height: 90.h,
          width: double.infinity,
          child: Row(
            children: [
              Container(
                width: 73.w,
                height: 92.h,
                decoration: BoxDecoration(color: AppColors.babyBlue),
                child: CachedNetworkImage(
                  width: 53.w,
                  height: 40.h,
                  imageUrl: cartItemEntity.productEntity.imageUrl!,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  progressIndicatorBuilder: (context, url, progress) {
                    return Skeletonizer(
                      child: Container(
                        width: 53.w,
                        height: 40.h,
                        color: Colors.indigo,
                      ),
                    );
                  },
                ),
              ),
              horizontalSpace(17),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cartItemEntity.productEntity.productName,
                          style: AppTextStyles.font13BlackBold,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<CartCubit>().removeProduct(
                              cartItemEntity.productEntity,
                            );
                          },
                          child: SvgPicture.asset(Assets.assetsSvgsTrash),
                        ),
                      ],
                    ),
                    verticalSpace(2),
                    Text(
                      '${cartItemEntity.calculateTotalWeight()} كم',
                      style: AppTextStyles.font13GrayRegular.copyWith(
                        color: AppColors.lightOrange,
                      ),
                    ),
                    verticalSpace(6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IncrementOrDecrementItem(
                              onTap: () {
                                cartItemEntity.incrementQuantity();
                                context.read<CartItemCubit>().updateCartItem(
                                  cartItemEntity,
                                );
                              },
                              backgroungColor: AppColors.mainGreen,
                              iconColor: Colors.white,
                              icon: Icons.add,
                            ),
                            horizontalSpace(16),
                            Text(
                              cartItemEntity.quantity.toString(),
                              style: AppTextStyles.font16BlackBold,
                            ),
                            horizontalSpace(16),
                            IncrementOrDecrementItem(
                              onTap: () {
                                cartItemEntity.decrementQuantity();
                                context.read<CartItemCubit>().updateCartItem(
                                  cartItemEntity,
                                );
                              },
                              backgroungColor: AppColors.babyBlue,
                              iconColor: AppColors.gray,
                              icon: Icons.remove,
                            ),
                          ],
                        ),
                        Text(
                          '${cartItemEntity.calculateTotalPrice()} جنيه ',
                          style: AppTextStyles.font16BlackBold.copyWith(
                            color: AppColors.lightOrange,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
