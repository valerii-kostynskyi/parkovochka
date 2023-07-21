import 'package:flutter/material.dart';
import 'package:parkovochka/presentation/widgets/bottom_sheet/widget/navigation_row_widget.dart';

class LightItemWidget extends StatelessWidget {
  final PageController controller;

  const LightItemWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('LightItemWidget'),
        NavigationRowWidget(controller: controller),
      ],
    );
  }
}
