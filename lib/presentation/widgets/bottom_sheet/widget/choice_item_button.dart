import 'package:flutter/material.dart';

class ChoiceItemButton extends StatelessWidget {
  final int index;
  final Function(int) onTap;
  final String title;
  final ValueNotifier<int> selectedIndexNotifier;

  const ChoiceItemButton({
    super.key,
    required this.index,
    required this.onTap,
    required this.title,
    required this.selectedIndexNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        width: 100,
        height: 100,
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 5.0,
        ),
        decoration: BoxDecoration(
          color: selectedIndexNotifier.value == index
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: selectedIndexNotifier.value == index
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).dividerColor,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: selectedIndexNotifier.value == index
                    ? Theme.of(context).colorScheme.background
                    : Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
