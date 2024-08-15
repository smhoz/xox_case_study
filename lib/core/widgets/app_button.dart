import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? child;
  final String? text;
  final Color? backgroundColor;
  final ButtonStyle? style;
  final double? width;
  final double? height;
  final Color? textColor;
  final double? fontSize;
  const AppButton(
      {super.key,
      this.backgroundColor,
      this.child,
      required this.onPressed,
      this.text,
      this.style,
      this.height,
      this.textColor,
      this.fontSize,
      this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.width,
      height: height,
      child: ElevatedButton(
          onPressed: onPressed,
          style: style,
          child: Text(
            text ?? "",
            style:
                context.textTheme.titleMedium?.copyWith(color: textColor ?? AppColors.buttonColor, fontSize: fontSize),
          )),
    );
  }
}
