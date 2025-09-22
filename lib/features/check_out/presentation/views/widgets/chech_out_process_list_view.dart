import 'package:flutter/material.dart';

import 'check_out_item_output.dart';

class ChechOutProcessListView extends StatelessWidget {
  const ChechOutProcessListView({
    super.key,
    required this.currentPageIndex,
    required this.pageController,
  });
  final PageController pageController;
  final int currentPageIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        3,
        (index) => Expanded(
          child: GestureDetector(
            onTap: () {
              pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 150),
                curve: Curves.easeIn,
              );
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
}

List<String> getCheckOutProcessList() => const ['الشحن', 'العنوان', 'المراجعه'];
