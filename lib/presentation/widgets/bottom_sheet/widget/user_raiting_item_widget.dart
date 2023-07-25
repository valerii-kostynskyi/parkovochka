import 'package:flutter/material.dart';

class UserRaitingItemWidget extends StatefulWidget {
  final PageController controller;

  const UserRaitingItemWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  UserRaitingItemWidgetState createState() => UserRaitingItemWidgetState();
}

class UserRaitingItemWidgetState extends State<UserRaitingItemWidget> {
  double rating = 5.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Оцініть велопарковку шкалою від 0 до 10'),
        Text(
          rating.toInt().toString(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Slider(
            value: rating,
            min: 0,
            max: 10,
            divisions: 10,
            onChanged: (newValue) {
              setState(() {
                rating = newValue;
              });
            },
          ),
        ),
      ],
    );
  }
}
