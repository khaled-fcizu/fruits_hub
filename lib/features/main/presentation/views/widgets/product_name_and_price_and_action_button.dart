import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/features/main/domain/entities/cart_item_entity.dart';
import 'package:fruit_hub/features/main/presentation/managers/cart_item_cubit/cart_item_cubit.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/increament_or_decrement_item.dart';

class ProductNameAndPriceAndActionButton extends StatefulWidget {
  const ProductNameAndPriceAndActionButton({
    super.key,
    required this.productEntity,
  });
  final ProductEntity productEntity;

  @override
  State<ProductNameAndPriceAndActionButton> createState() =>
      _ProductNameAndPriceAndActionButtonState();
}

class _ProductNameAndPriceAndActionButtonState
    extends State<ProductNameAndPriceAndActionButton> {
  int quantity = 1;
  late CartItemEntity cartItemEntity;
  @override
  void initState() {
    cartItemEntity = CartItemEntity(
      productEntity: widget.productEntity,
      quantity: quantity,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 33.w, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.productEntity.productName,
                style: AppTextStyles.font16BlackBold.copyWith(
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 4.h),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${widget.productEntity.price} جنية',
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
          Row(
            children: [
              IncrementOrDecrementItem(
                iconSize: 30,
                onTap: () {
                  setState(() {
                    cartItemEntity.incrementQuantity();
                  });
                  context.read<CartItemCubit>().updateCartItem(cartItemEntity);
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
                iconSize: 30,
                onTap: () {
                  if (quantity > 1) {
                    setState(() {
                      
                      cartItemEntity.decrementQuantity();
                    });
                  context.read<CartItemCubit>().updateCartItem(cartItemEntity);
                  }
                },
                backgroungColor: AppColors.babyBlue,
                iconColor: AppColors.gray,
                icon: Icons.remove,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
