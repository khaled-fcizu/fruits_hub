import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/domain/bottom_nav_bar_entity.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/bottom_navigation_bar/bottom_nav_item_output.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onTap});
  final ValueChanged<int> onTap;
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedInedex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 25,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: BottomNavBarEntity.bottomNavBarItems.asMap().entries.map((e) {
          int index = e.key;
          BottomNavBarEntity item = e.value;
          return Expanded(
            flex: index == selectedInedex ? 3 : 2,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedInedex = index;
                });
                widget.onTap(index);
              },
              child: BottomNavItemOutput(
                isActive: selectedInedex == index,
                bottomNavBarEntity: item,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
