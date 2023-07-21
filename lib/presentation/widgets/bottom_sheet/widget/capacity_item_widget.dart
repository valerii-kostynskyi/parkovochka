import 'package:flutter/material.dart';
import 'package:parkovochka/style/theme.dart';

class CapacityItemWidget extends StatelessWidget {
  final PageController controller;
  final ValueNotifier<int> selectedIndexNotifier = ValueNotifier<int>(0);
  final List<String> chipLabels = ['до 5', 'від 5 до 10', 'більше 10'];

  CapacityItemWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Оцінка кількості місць для паркування велосипедів:'),
        ),
        Wrap(
          spacing: 8,
          children: List.generate(
            chipLabels.length,
            (index) => ValueListenableBuilder<int>(
              valueListenable: selectedIndexNotifier,
              builder: (context, selectedIndex, _) {
                return _choiceItem(index);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _choiceItem(int index) {
    return GestureDetector(
      onTap: () => selectedIndexNotifier.value = index,
      child: Container(
        width: 100,
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
        decoration: BoxDecoration(
          color: selectedIndexNotifier.value == index
              ? lightTheme.colorScheme.primary
              : Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: selectedIndexNotifier.value == index
                ? lightTheme.colorScheme.primary
                : Colors.grey,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              chipLabels[index],
              style: TextStyle(
                color: selectedIndexNotifier.value == index
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
