import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/increament_or_decrement_item.dart';

class ProductNameAndPriceAndActionButton extends StatelessWidget {
  const ProductNameAndPriceAndActionButton({
    super.key,
    required this.productEntity,
  });
  final ProductEntity productEntity;
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
                productEntity.productName,
                style: AppTextStyles.font16BlackBold.copyWith(
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 4.h),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${productEntity.price} جنية',
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
                onTap: () {},
                backgroungColor: AppColors.mainGreen,
                iconColor: Colors.white,
                icon: Icons.add,
              ),
              horizontalSpace(16),
              Text(3.toString(), style: AppTextStyles.font16BlackBold),
              horizontalSpace(16),
              IncrementOrDecrementItem(
                iconSize: 30,
                onTap: () {},
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
