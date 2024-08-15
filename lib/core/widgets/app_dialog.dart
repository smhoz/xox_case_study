import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../theme/app_colors.dart';
import 'app_border_radius.dart';
import 'app_button.dart';
import 'app_sizedbox.dart';

class AppDialog extends StatelessWidget {
  final String? title, description, okButtonTitle, cancelButtonTitle;
  final Widget? contentChild;
  final bool isDisabledOkButton;
  final bool isDisabledCancelButton;
  final VoidCallback? isOkButtonOnPressed;
  final VoidCallback? isCancelButtonOnPressed;
  const AppDialog(
      {super.key,
      this.contentChild,
      this.description,
      this.isCancelButtonOnPressed,
      this.isDisabledCancelButton = false,
      this.isDisabledOkButton = false,
      this.isOkButtonOnPressed,
      this.cancelButtonTitle,
      this.okButtonTitle,
      this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.circularSizeMediumValueRadius()),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      title: Text(title ?? ""),
      content: contentChild ?? Text(description ?? ""),
      actions: [
        Row(
          children: [
            if (!isDisabledCancelButton)
              Expanded(
                child: AppButton(
                  onPressed: isCancelButtonOnPressed ?? () => Get.back(),
                  style: cancelButtonStyle,
                  fontSize: 16,
                  text: cancelButtonTitle ?? "İptal",
                ),
              ),
            if (!isDisabledOkButton) const AppSizedBox.onlyMediumWidthSizedBox(),
            if (!isDisabledOkButton)
              Expanded(
                child: AppButton(
                  onPressed: isOkButtonOnPressed ?? () => Get.back(),
                  text: okButtonTitle ?? "Tamam",
                  fontSize: 16,
                  style: okButtonStyle,
                ),
              ),
          ],
        )
      ],
    );
  }

  ButtonStyle get cancelButtonStyle {
    return ElevatedButton.styleFrom(
      elevation: 0,
      minimumSize: const Size.fromHeight(36),
      shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.circularSizeMediumValueRadius()),
      backgroundColor: AppColors.errorColor,
      shadowColor: AppColors.errorColor,
      backgroundBuilder: (context, states, child) {
        return Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [AppColors.errorColor, AppColors.errorColorLight],
              ),
              borderRadius: AppBorderRadius.circularSizeMediumValueRadius(),
              boxShadow: const [
                BoxShadow(color: AppColors.errorColor, offset: Offset(0, 0), blurRadius: 20),
              ],
            ),
            child: child);
      },
    );
  }

  ButtonStyle get okButtonStyle {
    return ElevatedButton.styleFrom(
      elevation: 0,
      minimumSize: const Size.fromHeight(36),
      shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.circularSizeMediumValueRadius()),
    );
  }
}
