import 'package:flutter/material.dart';
import 'package:whats_app/core/resources/color_manager.dart';

class NavItem extends StatelessWidget {
  final IconData? iconData;
  final bool isSelected;

  const NavItem(
    this.iconData, {
    super.key,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    var selectedColor =
        Theme.of(context).bottomNavigationBarTheme.selectedItemColor ??
            ColorManager.green;
    var unselectedColor =
        Theme.of(context).bottomNavigationBarTheme.unselectedItemColor ??
            ColorManager.white;
    return Container(
      width: 66,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.horizontal(
          left: Radius.circular(18),
          right: Radius.circular(18),
        ),
        color: isSelected ? selectedColor.withOpacity(0.2) : Colors.transparent,
      ),
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        iconData,
        size: 28,
        color: isSelected ? selectedColor : unselectedColor,
      ),
    );
  }
}
