import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fruit_hub/features/main/presentation/managers/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/main_view_body.dart';

class MainViewBodyBlocListener extends StatelessWidget {
  const MainViewBodyBlocListener({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listenWhen: (previous, current) {
        return current is CartProductAdded || current is CartProductRemoved;
      },
      listener: (context, state) {
        if (state is CartProductAdded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('product added to cart'),
              duration: const Duration(seconds: 1),
            ),
          );
        } else if (state is CartProductRemoved) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('product removed from cart'),
              duration: const Duration(seconds: 1),
            ),
          );
        }
      },
      child: MainViewBody(currentIndex: currentIndex),
    );
  }
}
