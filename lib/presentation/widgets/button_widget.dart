import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final Widget? leading;
  final Widget? trailing;
  final double? width;
  final double height;
  final double borderRadius;
  final double elevation;
  final Color? color;
  final TextStyle? textStyle;
  final ShapeBorder? shapeBorder;
  final bool disabled;
  final bool loading;
  final bool autoSize; // only width now
  final bool borderColor;

  const ButtonWidget({
    Key? key,
    this.text,
    this.width,
    this.onPressed,
    this.leading,
    this.trailing,
    this.color,
    this.textStyle,
    this.shapeBorder,
    this.height = 50,
    this.elevation = 0,
    this.borderRadius = 15,
    this.disabled = false,
    this.loading = false,
    this.autoSize = false,
    this.borderColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: disabled || loading,
      child: SizedBox(
        height: height,
        width: width,
        child: MaterialButton(
          elevation: elevation,
          padding: const EdgeInsets.all(0),
          minWidth: 0,
          // disabledColor: Get.theme.dividerColor,
          onPressed: onPressed,
          // color: disabled || loading
          //     ? context.theme.disabledColor.withOpacity(0.5)
          //     : (color ?? Get.theme.colorScheme.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            mainAxisSize: autoSize ? MainAxisSize.min : MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (loading) _loading(),
              if (leading != null) _widget(leading!),
              if (text != null && !loading)
                Flexible(
                  child: FittedBox(
                    child: Text(
                      text!,
                      textAlign: TextAlign.center,
                      // style: textStyle ??
                      //     Get.theme.textTheme.labelSmall!.copyWith(
                      //       fontSize: 14,
                      //       letterSpacing: 0.3,
                      //       color: (disabled)
                      //           ? Get.theme.colorScheme.onBackground
                      //           : Get.theme.textTheme.labelSmall!.color,
                      //     ),
                    ),
                  ),
                ),
              if (trailing != null) _widget(trailing!),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loading() {
    return const SizedBox(
      height: 24,
      width: 24,
      child: CircularProgressIndicator(),
    );
  }

  Widget _widget(Widget icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 9.0),
      child: icon,
    );
  }
}
