import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/views/cart_view.dart';
import 'package:fruit_hub/features/home/presentation/views/home_view.dart';
import 'package:fruit_hub/features/home/presentation/views/products_view.dart';
import 'package:fruit_hub/features/home/presentation/views/profile_view.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/bottom_navigation_bar/custom_bottom_navigation_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: (index) => setState(() => currentIndex = index),
      ),
      body: SafeArea(child: IndexedStack(
        index: currentIndex,
        children: [
          HomeView(),
          ProductsView(),
          CartView(),
          ProfileView(),
        ],
      )),
    );
  }
}