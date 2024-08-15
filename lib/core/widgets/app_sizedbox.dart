import 'package:flutter/material.dart';

class AppSizedBox extends SizedBox {
  const AppSizedBox.onlyMediumHeightSizedBox({super.key}) : super(height: 12);
  const AppSizedBox.onlyDisplayHeightSizedBox({super.key}) : super(height: 16);

  const AppSizedBox.onlyLowHeightSizedBox({super.key}) : super(height: 8);
  const AppSizedBox.onlyVeryLowHeightSizedBox({super.key}) : super(height: 4);

  const AppSizedBox.onlyVeryHighHeightSizedBox({super.key}) : super(height: 32);
  const AppSizedBox.onlyHighHeightSizedBox({super.key}) : super(height: 24);

  const AppSizedBox.onlyLowWidthSizedBox({super.key}) : super(width: 8);
  const AppSizedBox.onlyMediumWidthSizedBox({super.key}) : super(width: 12);
  const AppSizedBox.onlyDisplayWidthSizedBox({super.key}) : super(width: 16);
}
