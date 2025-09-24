import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helpers/extentions.dart';
import 'package:fruit_hub/core/theming/app_colors.dart';
import 'package:fruit_hub/features/check_out/presentation/views/managers/cubit/add_order_cubit.dart';

class CheckOutBlocBuilder extends StatelessWidget {
  const CheckOutBlocBuilder({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderFailure) {
          context.pop();
          context.showSnackBar(state.errorMessage);
        } else if (state is AddOrderSuccess) {
          context.pop();
          context.showSnackBar('تم اضافة الطلب بنجاح');
        } else {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: CircularProgressIndicator(color: AppColors.mainLightGreen),
            ),
          );
        }
      },
      builder: (context, state) {
        return child;
      },
    );
  }
}
