import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';

class CustomChickBox extends StatelessWidget {
  const CustomChickBox({
    super.key,
    required this.isChicked,
    required this.onChicked,
  });
  final bool isChicked;
  final ValueChanged<bool> onChicked;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChicked(!isChicked);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        width: 24.w,
        height: 24.h,
        decoration: ShapeDecoration(
          color: isChicked ? AppColors.mainGreen : Colors.white,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(
              width: 1.5,
              color: isChicked ? Colors.transparent : AppColors.lightGray,
            ),
          ),
        ),
        child: isChicked
            ? Padding(
                padding: const EdgeInsets.all(2),
                child: SvgPicture.asset('assets/svgs/true.svg'),
              )
            : SizedBox.shrink(),
      ),
    );
  }
}
