import 'package:flutter/material.dart';

import 'check_out_item_output.dart';

class ChechOutProcessListView extends StatelessWidget {
  const ChechOutProcessListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        4,
        (index) => Expanded(
          child: CheckOutItemOutput(
            text: getCheckOutProcessList()[index],
            isActive: true,
            index: index + 1,
          ),
        ),
      ),
    );
  }
}

List<String> getCheckOutProcessList() => const [
  'الشحن',
  'العنوان',
  'الدفع',
  'المراجعه',
];
