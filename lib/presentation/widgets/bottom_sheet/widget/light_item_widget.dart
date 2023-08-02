import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parkovochka/bloc/parking_bloc/parking_bloc.dart';

class LightItemWidget extends StatelessWidget {
  final PageController controller;
  final ValueNotifier<bool> likeSelected;

  LightItemWidget({
    Key? key,
    required this.controller,
  })  : likeSelected = ValueNotifier<bool>(true),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Чи є у велопарковки освітлення?',
          ),
        ),
        Center(
          child: CustomIconButton(
            icon: 'assets/icons/light_off.svg',
            selectedIcon: 'assets/icons/light_on.svg',
            selected: likeSelected,
            onPressed: () {
              likeSelected.value = !likeSelected.value;
              context.read<ParkingBloc>().add(
                    AddLightEvent(light: likeSelected.value),
                  );
            },
          ),
        ),
      ],
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final String icon;
  final String selectedIcon;
  final ValueNotifier<bool> selected;
  final VoidCallback onPressed;

  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.selectedIcon,
    required this.selected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ValueListenableBuilder<bool>(
        valueListenable: selected,
        builder: (context, isSelected, child) {
          return IconButton(
            iconSize: 150,
            color: Colors.red,
            icon: SizedBox(
              height: 100,
              width: 100,
              child: SvgPicture.asset(
                isSelected ? selectedIcon : icon,
              ),
            ),
            onPressed: onPressed,
          );
        },
      ),
    );
  }
}
