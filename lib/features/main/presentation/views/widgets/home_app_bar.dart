import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/notification_ring.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 25.r,
                backgroundImage: const AssetImage(
                  'assets/images/profile_image.png',
                ),
              ),
              title: Text(
                'صباح الخير !..',
                style: AppTextStyles.font16GrayRegular,
              ),
              subtitle: Text(
                // FirebaseAuth.instance.currentUser!.displayName!,
                'احمد محمد',
                style: AppTextStyles.font16BlackBold,
              ),
            ),
          ),
          NotificationRing(),
        ],
      ),
    );
  }
}
