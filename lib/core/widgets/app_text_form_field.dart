import 'package:flutter/material.dart';

import '../extensions/context_extension.dart';
import '../theme/app_colors.dart';
import 'app_border_radius.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? child;
  final IconData? suffixIcon;
  final Function(String? value)? onChanged;
  final String? Function(String?)? validator;
  const AppTextFormField(
      {super.key, this.controller, this.hintText, this.child, this.suffixIcon, this.onChanged, this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.paddingLowVertical,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.appTextFormFieldBgColor,
        boxShadow: [_boxShadow],
        borderRadius: AppBorderRadius.circularSizeMediumValueRadius(),
      ),
      child: child ??
          TextFormField(
            controller: controller,
            onChanged: onChanged,
            validator: validator ??
                (value) {
                  if ((value ?? "").isEmpty) return "Bu alan boş bırakılamaz";
                  return null;
                },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText ?? "",
              suffixIcon: Icon(suffixIcon, color: AppColors.primaryColor),
              iconColor: AppColors.primaryColor,
              hintStyle: context.textTheme.bodyLarge?.copyWith(color: AppColors.appTextHintStyleColor),
            ),
            style: context.textTheme.bodyLarge,
          ),
    );
  }

  BoxShadow get _boxShadow {
    return BoxShadow(
      color: AppColors.appTextFormFieldShadowColor.withOpacity(0.2),
      offset: const Offset(0, 8),
      blurRadius: 20,
    );
  }
}
