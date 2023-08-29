import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {
  final String icon;
  final String selectedIcon;
  final ValueNotifier<bool> selected;
  final VoidCallback onPressed;
  final bool fillIcon;

  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.selectedIcon,
    required this.selected,
    required this.onPressed,
    this.fillIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ValueListenableBuilder<bool>(
        valueListenable: selected,
        builder: (context, isSelected, child) {
          return SizedBox(
            height: 100,
            width: 100,
            child: SvgPicture.asset(
              isSelected ? selectedIcon : icon,
              color: fillIcon
                  ? isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurface
                  : null,
            ),
          );
        },
      ),
    );
  }
}
