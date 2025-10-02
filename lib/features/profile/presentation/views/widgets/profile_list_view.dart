import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/widgets/custom_divider.dart';
import 'package:fruit_hub/features/profile/domain/entities/profile_item_entity.dart';
import 'package:fruit_hub/features/profile/presentation/views/widgets/profile_item.dart';

class ProfileListView extends StatelessWidget {
  const ProfileListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 244.h,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ProfileItem(
            profileItemEntity: ProfileItemEntity.profileItems[index],
          );
        },
        separatorBuilder: (context, index) => CustomDivider(),
        itemCount: ProfileItemEntity.profileItems.length,
      ),
    );
  }
}
