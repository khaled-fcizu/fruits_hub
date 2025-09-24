import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/spacing_helper.dart';
import 'package:fruit_hub/features/check_out/presentation/views/widgets/delivary_address_widget.dart';
import 'package:fruit_hub/features/check_out/presentation/views/widgets/order_summary_widget.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(24),
        OrderSummaryWidget(),
        verticalSpace(16),
        DelivaryAddressWidget(),
      ],
    );
  }
}
