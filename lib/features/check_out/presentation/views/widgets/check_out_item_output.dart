import 'package:flutter/material.dart';
import 'package:fruit_hub/features/check_out/presentation/views/widgets/active_check_out_item.dart';
import 'package:fruit_hub/features/check_out/presentation/views/widgets/inactive_check_out_item.dart';

class CheckOutItemOutput extends StatelessWidget {
  const CheckOutItemOutput({
    super.key,
    required this.text,
    required this.index,
    required this.isActive,
  });
  final String text;
  final int index;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: InactiveCheckOutItem(text: text, index: index),
      secondChild: ActiveCheckOutItem(text: text),
      crossFadeState: isActive
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      duration: Duration(milliseconds: 300),
    );
  }
}
