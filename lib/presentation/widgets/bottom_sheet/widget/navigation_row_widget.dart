import 'package:flutter/material.dart';

class NavigationRowWidget extends StatelessWidget {
  final PageController controller;

  const NavigationRowWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            controller.previousPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear,
            );
          },
          child: const Text('Previous'),
        ),
        TextButton(
          onPressed: () {
            controller.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear,
            );
          },
          child: const Text('Next'),
        ),
      ],
    );
  }
}
