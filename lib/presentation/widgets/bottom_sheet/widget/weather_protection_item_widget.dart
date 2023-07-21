import 'package:flutter/material.dart';
import 'package:parkovochka/presentation/widgets/bottom_sheet/widget/navigation_row_widget.dart';

class WetherProtectionItemWidget extends StatelessWidget {
  final PageController controller;

  const WetherProtectionItemWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('WetherProtectionItemWidget'),
        NavigationRowWidget(controller: controller),
      ],
    );
  }
}
