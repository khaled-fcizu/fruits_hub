import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/notification_ring.dart';

AppBar buildAppBar(
  BuildContext context, {
  bool isRingVisible = true,
  bool isLeadingVisible = true,
  required String title,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: Text(title, style: AppTextStyles.font19BlackBold),
    actions: [
     isRingVisible ? Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: NotificationRing(),
      ): const SizedBox.shrink(),
    ],
    leading: isLeadingVisible
        ? GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: EdgeInsets.only(right: 16.w),
              child: Container(
                decoration: ShapeDecoration(
                  shape: CircleBorder(
                    side: BorderSide(color: Colors.grey.shade300, width: .7.w),
                  ),
                ),
                child: Center(child: Icon(Icons.arrow_back_ios, size: 22)),
              ),
            ),
          )
        : SizedBox.shrink(),
  );
}
