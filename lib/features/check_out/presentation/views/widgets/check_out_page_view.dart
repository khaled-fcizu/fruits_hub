import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/features/check_out/presentation/views/widgets/adress_section.dart';
import 'package:fruit_hub/features/check_out/presentation/views/widgets/shipping_section.dart';

class CheckOutPageView extends StatelessWidget {
  const CheckOutPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: PageView.builder(
        controller: pageController,
        itemCount: getCheckOutPages().length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return getCheckOutPages()[index];
        },
      ),
    );
  }
}

List<Widget> getCheckOutPages() => [
  const ShippingSection(),
  const AdressSection(),
  const Placeholder(),
  const Placeholder(),
];
