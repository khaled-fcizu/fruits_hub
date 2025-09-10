import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NotificationRing extends StatelessWidget {
  const NotificationRing({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20.r,
      backgroundColor: Colors.grey.shade200,
      child: SvgPicture.asset(
        'assets/svgs/notification_ring.svg',
        width: 20.w,
        height: 20.h,
      ),
    );
  }
}
