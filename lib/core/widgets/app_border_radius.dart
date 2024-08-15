import 'package:flutter/material.dart';

import '../constants/app_value_constants.dart';

class AppBorderRadius extends BorderRadius {
  AppBorderRadius.circularSizeLowValueRadius() : super.circular(AppValueConstants.instance.lowValue);
  AppBorderRadius.circularSizeMediumValueRadius() : super.circular(AppValueConstants.instance.mediumValue);
}
