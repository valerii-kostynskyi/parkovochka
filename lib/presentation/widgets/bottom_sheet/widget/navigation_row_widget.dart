import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkovochka/bloc/bottom_sheet/bottom_sheet_bloc.dart';

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
            context.read<BottomSheetBloc>().add(
                  const ChangeButtonVisibilityEvent(),
                );

            controller.previousPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear,
            );
          },
          child: const Text('Previous'),
        ),
        TextButton(
          onPressed: () {
            context.read<BottomSheetBloc>().add(
                  const ChangeButtonVisibilityEvent(),
                );
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
