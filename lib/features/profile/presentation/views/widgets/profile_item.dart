import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/features/profile/domain/entities/profile_item_entity.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.profileItemEntity});
  final ProfileItemEntity profileItemEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset( profileItemEntity.prefixIcon),
        horizontalSpace(7),
        Text(profileItemEntity.title, style: AppTextStyles.font13GraySimiBold),
        Spacer(),
        profileItemEntity.suffixWidget,
      ],
    );
  }
}
