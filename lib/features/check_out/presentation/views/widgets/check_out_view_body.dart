import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/helpers/extentions.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/core/widgets/app_text_button.dart';
import 'package:fruit_hub/features/check_out/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/check_out/presentation/views/widgets/chech_out_process_list_view.dart';
import 'package:fruit_hub/features/check_out/presentation/views/widgets/check_out_page_view.dart';

class CheckOutViewBody extends StatefulWidget {
  const CheckOutViewBody({super.key});

  @override
  State<CheckOutViewBody> createState() => _CheckOutViewBodyState();
}

class _CheckOutViewBodyState extends State<CheckOutViewBody> {
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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            verticalSpace(16),
            ChechOutProcessListView(
              pageController: pageController,
              currentPageIndex: currentPageIndex,
            ),
            Expanded(
              child: CheckOutPageView(
                valueNotifier: valueNotifier,
                pageController: pageController,
                formKey: formKey,
              ),
            ),
            AppButton(
              onPressed: () {
                if (currentPageIndex == 0) {
                  _handleShippingSectionValidation(context);
                } else if (currentPageIndex == 1) {
                  _handleAddressSectionValidation(context);
                }
              },
              buttonText: getCheckOutButtonText()[currentPageIndex],
            ),
          ],
        ),
      ),
    );
  }

  void _handleAddressSectionValidation(BuildContext context) {
    valueNotifier.value = AutovalidateMode.always;
    if (formKey.currentState!.validate()) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeIn,
      );
    } else {
      context.showSnackBar('من فضلك ادخل البيانات المطلوبه');
    }
  }

  void _handleShippingSectionValidation(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeIn,
      );
    } else {
      context.showSnackBar('من فضلك اختر طريقه الدفع');
    }
  }
}

List<String> getCheckOutButtonText() => const [
  'التالي',
  'التالي',
  'الدفع عبر PayPal',
];
