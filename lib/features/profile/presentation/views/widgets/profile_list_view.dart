import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/utils/app_assets.dart';
import 'package:fruit_hub/core/widgets/custom_divider.dart';
import 'package:fruit_hub/features/profile/presentation/views/widgets/profile_item.dart';

class ProfileListView extends StatelessWidget {
  const ProfileListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return ProfileItem(
            widget: SvgPicture.asset(Assets.assetsSvgsArrowRight),
          );
        },
        separatorBuilder: (context, index) => CustomDivider(),
        itemCount: 7,
      ),
    );
  }
}
