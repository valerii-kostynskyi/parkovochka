import 'package:flutter/material.dart';
import 'package:parkovochka/presentation/widgets/bottom_sheet/widget/navigation_row_widget.dart';

class AddPhotoItemWidget extends StatelessWidget {
  final PageController controller;

  const AddPhotoItemWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('AddPhotoItemWidget'),
        NavigationRowWidget(controller: controller),
      ],
    );
  }
}
