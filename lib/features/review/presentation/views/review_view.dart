import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';
import 'package:fruit_hub/features/review/presentation/views/widgets/rating_statistics_widgets.dart';
import 'package:fruit_hub/features/review/presentation/views/widgets/review_item_list_view.dart';
import 'package:fruit_hub/features/review/presentation/views/widgets/review_text_field.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'المراجعه', isRingVisible: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(16),
                  ReviewTextField(),
                  verticalSpace(16),
                  Text('324 مراجعه', style: AppTextStyles.font13BlackBold),
                  verticalSpace(5),
                  RatingStatisticsWidgets(),
                  verticalSpace(16),
                ],
              ),
            ),
            ReviewItemListView(),
          ],
        ),
      ),
    );
  }
}
