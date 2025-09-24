import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helpers/extentions.dart';
import 'package:fruit_hub/features/check_out/domain/entities/order_entity.dart';

import 'check_out_item_output.dart';

class ChechOutProcessListView extends StatelessWidget {
  const ChechOutProcessListView({
    super.key,
    required this.currentPageIndex,
    required this.pageController,
    required this.formKey,
    required this.valueNotifier,
  });
  final PageController pageController;
  final int currentPageIndex;
  final GlobalKey<FormState> formKey;
  final ValueNotifier<AutovalidateMode> valueNotifier;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        3,
        (index) => Expanded(
          child: GestureDetector(
            onTap: () {
              if (currentPageIndex == 0) {
                _handleShippingSectionValidation(context);
              } else if (currentPageIndex == 1) {
                _handleAddressSectionValidation(context);
              }

              if (currentPageIndex > index) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeIn,
                );
              }
            },
            child: CheckOutItemOutput(
              text: getCheckOutProcessList()[index],
              isActive: index <= currentPageIndex,
              index: index + 1,
            ),
          ),
        ),
      ),
    );
  }

  void _handleAddressSectionValidation(BuildContext context) {
    if (formKey.currentState!.validate()) {
      valueNotifier.value = AutovalidateMode.always;
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

List<String> getCheckOutProcessList() => const ['الشحن', 'العنوان', 'المراجعه'];
