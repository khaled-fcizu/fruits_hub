import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncrementOrDecrementItem extends StatelessWidget {
  const IncrementOrDecrementItem({
    super.key,
    required this.backgroungColor,
    required this.iconColor,
    required this.icon,
    this.onTap, required this.iconSize,
  });
  final Color backgroungColor, iconColor;
  final IconData icon;
  final void Function()? onTap;
  final   double iconSize;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: backgroungColor,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor, size: iconSize.sp),
      ),
    );
  }
}
