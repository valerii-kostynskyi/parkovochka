import 'package:flutter/material.dart';

class DescriptionItemWidget extends StatelessWidget {
  final PageController controller;

  const DescriptionItemWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('DescriptionItemWidget'),
      ],
    );
  }
}
