import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/features/check_out/domain/entities/order_entity.dart';
import 'package:provider/provider.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 4.h),
      decoration: BoxDecoration(
        color: AppColors.babyBlue,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('المجموع الفرعي :', style: AppTextStyles.font13GrayRegular),
              Text(
                '${context.read<OrderInputEntity>().cartEntity.calculateTotalPrice().toInt()} جنيه',
                style: AppTextStyles.font16BlackSimiBold,
              ),
            ],
          ),
          verticalSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('التوصيل  :', style: AppTextStyles.font13GrayRegular),
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Text('30جنية', style: AppTextStyles.font13GraySimiBold),
              ),
            ],
          ),
          verticalSpace(8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.w),
            child: Divider(color: Colors.grey.shade300, thickness: .7.h),
          ),
          verticalSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('الكلي', style: AppTextStyles.font16BlackBold),
              Text(
                '${context.read<OrderInputEntity>().cartEntity.calculateTotalPrice().toInt() + 30} جنيه',
                style: AppTextStyles.font16BlackBold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
