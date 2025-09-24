import 'package:flutter/material.dart';
import 'package:fruit_hub/core/helpers/get_user_data.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';
import 'package:fruit_hub/features/check_out/domain/entities/adress_phase_entity.dart';
import 'package:fruit_hub/features/check_out/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/check_out/presentation/views/widgets/check_out_view_body.dart';
import 'package:fruit_hub/features/main/domain/entities/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key, required this.cartEntity});
  final CartEntity cartEntity;

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  int currentIndex = 0;
  late OrderEntity orderEntity;

  @override
  void initState() {
    orderEntity = OrderEntity(
      uId: getUserData().uid,
      cartEntity: widget.cartEntity,
      adressPhaseEntity: AdressPhaseEntity(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: getCheckOutAppBarTitle()[currentIndex],
        isRingVisible: false,
      ),
      body: Provider.value(
        value: orderEntity,
        child: CheckOutViewBody(
          currentIndex: (value) {
            currentIndex = value;
            setState(() {});
          },
        ),
      ),
    );
  }

  List<String> getCheckOutAppBarTitle() => const [
    'الشحن',
    'العنوان',
    'الدفع و المراجعه',
  ];
}
