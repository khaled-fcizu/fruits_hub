import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/core/utils/app_assets.dart';
import 'package:fruit_hub/core/widgets/custom_app_bar.dart';
import 'package:fruit_hub/core/widgets/custom_divider.dart';
import 'package:fruit_hub/features/profile/domain/entities/profile_item_entity.dart';
import 'package:fruit_hub/features/profile/presentation/views/widgets/log_out_contianer.dart';
import 'package:fruit_hub/features/profile/presentation/views/widgets/profile_item.dart';
import 'package:fruit_hub/features/profile/presentation/views/widgets/profile_list_view.dart';
import 'package:fruit_hub/features/profile/presentation/views/widgets/profile_photo_and_name_and_email.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'حسابي', icon: SizedBox.shrink()),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(16),
            ProfilePhotoAndNameAndEmail(),
            verticalSpace(16),
            Text('عام', style: AppTextStyles.font13BlackSemiBold),
            verticalSpace(16),
            ProfileListView(),
            CustomDivider(),
            verticalSpace(22),
            Text('المساعده', style: AppTextStyles.font13BlackSemiBold),
            verticalSpace(16),
            ProfileItem(
              profileItemEntity: ProfileItemEntity(
                prefixIcon: Assets.assetsSvgsInfoCircle,
                title: 'سياسة الخصوصية',
                suffixWidget: SvgPicture.asset(
                  Assets.assetsSvgsArrowRight,
                  width: 16.w,
                  height: 16.h,
                ),
              ),
            ),
            CustomDivider(),
            verticalSpace(16),
            LogOutContainer(),

          ],
        ),
      ),
    );
  }
}
