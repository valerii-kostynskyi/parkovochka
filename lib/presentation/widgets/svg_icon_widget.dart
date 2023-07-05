import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SVGIconWidget extends StatelessWidget {
  final String icon;
  final Color? color;
  final Function()? onTap;
  final double? width;
  final double? height;

  const SVGIconWidget({
    required this.icon,
    this.color,
    this.onTap,
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: icon.contains('http')
          ? SvgPicture.network(
              icon,
              color: color,
              width: width,
              height: height,
            )
          : SvgPicture.asset(
              'assets/icons/$icon.svg',
              color: color,
              width: width,
              height: height,
            ),
    );
  }
}
