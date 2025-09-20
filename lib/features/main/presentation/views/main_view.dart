import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/main/presentation/managers/cubit/cart_cubit.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:fruit_hub/features/main/presentation/views/widgets/cart_bloc_listener.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          onTap: (index) => setState(() => currentIndex = index),
        ),
        body: SafeArea(child: CartBlocListener(currentIndex: currentIndex)),
      ),
    );
  }
}
