import 'package:flutter/material.dart';
import 'package:parkovochka/presentation/widgets/button_widget.dart';
import 'package:parkovochka/presentation/widgets/svg_icon_widget.dart';
import 'package:parkovochka/style/theme.dart';

class AddParkingBottomSheet extends StatelessWidget {
  const AddParkingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      height: 500,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SVGIconWidget(
                  icon: 'icon_close',
                ),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            child: SizedBox(
              height: 56,
              width: double.infinity,
              child: Builder(
                builder: (context) {
                  return ButtonWidget(
                    onPressed: () {},
                    text: 'add parkovochka'.toUpperCase(),
                    leading: SVGIconWidget(
                      icon: 'icon_plus',
                      color: lightTheme.iconTheme.color,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
