import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/core/utils/app_assets.dart';

class RatingStatisticsWidgets extends StatelessWidget {
  const RatingStatisticsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text('الملخص', style: AppTextStyles.font16BlackSimiBold),
              ),
              verticalSpace(8),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(Assets.assetsSvgsStar),
                          horizontalSpace(8),
                          Text('4.5', style: AppTextStyles.font13BlackBold),
                        ],
                      ),
                      verticalSpace(22),
                      Text(
                        '88%',
                        style: AppTextStyles.font16GrayRegular.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      verticalSpace(4),
                      Text(
                        'موصي بها',
                        style: AppTextStyles.font13GrayRegular.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  horizontalSpace(22),
                  Column(
                    children: [
                      RatingStatisticsItem(
                        ratingItem: Assets.assetsSvgsFiveStar,
                        num: 5,
                      ),
                      verticalSpace(8),
                      RatingStatisticsItem(
                        ratingItem: Assets.assetsSvgsFourStar,
                        num: 4,
                      ),
                      verticalSpace(8),
                      RatingStatisticsItem(
                        ratingItem: Assets.assetsSvgsThreeStar,
                        num: 3,
                      ),
                      verticalSpace(8),
                      RatingStatisticsItem(
                        ratingItem: Assets.assetsSvgsTwoStar,
                        num: 2,
                      ),
                      verticalSpace(8),
                      RatingStatisticsItem(
                        ratingItem: Assets.assetsSvgsOneStar,
                        num: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RatingStatisticsItem extends StatelessWidget {
  const RatingStatisticsItem({
    super.key,
    required this.num,
    required this.ratingItem,
  });
  final int num;
  final String ratingItem;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SvgPicture.asset(ratingItem, width: 241.w, height: 8.h),
        horizontalSpace(8),
        Text(num.toString(), style: AppTextStyles.font13BlackSemiBold),
      ],
    );
  }
}
