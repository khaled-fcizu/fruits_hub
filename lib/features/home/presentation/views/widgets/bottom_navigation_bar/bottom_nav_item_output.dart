import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/domain/bottom_nav_bar_entity.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/bottom_navigation_bar/active_bootom_nav_item.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/bottom_navigation_bar/inactive_bottom_nav_item.dart';

class BottomNavItemOutput extends StatelessWidget {
  const BottomNavItemOutput({
    super.key,
    required this.isActive,
    required this.bottomNavBarEntity,
  });
  final BottomNavBarEntity bottomNavBarEntity;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveBottomNavItem(
            image: bottomNavBarEntity.activeImage,
            text: bottomNavBarEntity.name,
          )
        : InactiveBottomNavItem(image: bottomNavBarEntity.inactiveImage);
  }
}