import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/core/utils/app_assets.dart';
import 'package:fruit_hub/features/main/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/increament_or_decrement_item.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      width: double.infinity,
      child: Expanded(
        child: Row(
          children: [
            Container(
              width: 73.w,
              height: 92.h,
              decoration: BoxDecoration(color: AppColors.babyBlue),
              child: Image.asset(
                width: 53.w,
                height: 40.h,
                cartItemEntity.productEntity.imageUrl!,
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
                      SvgPicture.asset(Assets.assetsSvgsTrash),
                    ],
                  ),
                  verticalSpace(2),
                  Text(
                    '${cartItemEntity.productEntity.calorieSUnitAmount} كم',
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
                            backgroungColor: AppColors.babyBlue,
                            iconColor: AppColors.gray,
                            icon: Icons.remove,
                          ),
                        ],
                      ),
                      Text(
                        '${cartItemEntity.productEntity.price} جنيه ',
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
      ),
    );
  }
}
