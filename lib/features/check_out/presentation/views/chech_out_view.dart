import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/widgets/app_text_button.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';
import 'package:fruit_hub/features/check_out/presentation/views/widgets/chech_out_process_list_view.dart';
import 'package:fruit_hub/features/check_out/presentation/views/widgets/check_out_page_view.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'الشحن', isRingVisible: false),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              verticalSpace(16),
              ChechOutProcessListView(
                pageController: pageController,
                currentPageIndex: currentPageIndex,
              ),
              Expanded(child: CheckOutPageView(pageController: pageController)),
              AppButton(
                onPressed: () {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 150),
                    curve: Curves.easeIn,
                  );
                },
                buttonText: 'التالي',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
