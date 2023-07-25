import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parkovochka/style/theme.dart';

class WetherProtectionItemWidget extends StatelessWidget {
  final PageController controller;
  final ValueNotifier<bool> likeSelected;
  final ValueNotifier<bool> dislikeSelected;

  WetherProtectionItemWidget({
    Key? key,
    required this.controller,
  })  : likeSelected = ValueNotifier<bool>(true),
        dislikeSelected = ValueNotifier<bool>(false),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Чи має велопарковка захист від погодніх умов(навіс, бокові стінки)?',
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomIconButton(
                icon: 'assets/icons/like.svg',
                selectedIcon: 'assets/icons/liked.svg',
                selected: likeSelected,
                onPressed: () {
                  likeSelected.value = true;
                  dislikeSelected.value = false;
                },
              ),
              CustomIconButton(
                icon: 'assets/icons/dislike.svg',
                selectedIcon: 'assets/icons/disliked.svg',
                selected: dislikeSelected,
                onPressed: () {
                  dislikeSelected.value = true;
                  likeSelected.value = false;
                },
              ),
            ],
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
                color: isSelected
                    ? lightTheme.colorScheme.primary
                    : lightTheme.colorScheme.onSurface,
              ),
            ),
            onPressed: onPressed,
          );
        },
      ),
    );
  }
}
