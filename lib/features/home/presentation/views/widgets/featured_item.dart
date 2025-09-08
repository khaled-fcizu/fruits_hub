import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: itemWidth,
      child: AspectRatio(
        aspectRatio: 342 / 158,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              right: itemWidth * .4,
              left: 0,
              child: Image.asset(
                'assets/images/app_icon.png',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: itemWidth * .5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: svg.Svg(
                    'assets/svgs/home_background_featured_item.svg',
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(right: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(25),
                    Text(
                      'عروض العيد',
                      style: AppTextStyles.font13GrayRegular.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    verticalSpace(12),
                    Text('خصم 25%', style: AppTextStyles.font19WhiteBold),
                    verticalSpace(7),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 28.w,
                          vertical: 4.h,
                        ),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      child: Text(
                        'تسوق الآن',
                        style: AppTextStyles.font13MainGreenBold.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
