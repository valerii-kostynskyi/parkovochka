import 'package:flutter/material.dart';
import 'package:parkovochka/presentation/widgets/bottom_sheet/widget/navigation_row_widget.dart';

class DescriptionItemWidget extends StatelessWidget {
  final PageController controller;

  const DescriptionItemWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('DescriptionItemWidget'),
      ],
    );
  }
}
