import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';

extension CustomGetDialogExtension on GetInterface {
  Future showProgressDialog({Function()? onWillPop}) async {
    await Get.dialog(
      Stack(
        alignment: Alignment.center,
        children: [
          SizedBox.square(
            dimension: Get.height * 0.05,
            child: const Icon(Icons.remove_red_eye, size: 44),
          ),
          SizedBox.square(
            dimension: Get.height * 0.115,
            child: CircularProgressIndicator(
              strokeWidth: 7,
              color: AppColors.primaryColor.withOpacity(0.75),
              backgroundColor: AppColors.appBarIconColor.withOpacity(0.15),
            ),
          )
        ],
      ),
      barrierDismissible: false,
    );
  }
}
