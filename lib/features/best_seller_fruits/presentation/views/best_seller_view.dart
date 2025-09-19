import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/theming/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/fruits_grid_view_bloc_builder.dart';

class BestSellerView extends StatelessWidget {
  const BestSellerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'الأكثر مبيعًا'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    verticalSpace(24),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'الأكثر مبيعًا',
                        style: AppTextStyles.font16BlackBold,
                      ),
                    ),
                    verticalSpace(8),
                  ],
                ),
              ),
              FruitsGridViewBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
