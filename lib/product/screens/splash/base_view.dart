import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/app_error.dart';

import '../../../core/widgets/app_loading.dart';
import 'base_controller.dart';

class BaseView extends GetView<BaseController> {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Obx(
        () {
          switch (controller.state) {
            case BaseState.initial:
            case BaseState.loading:
              return const AppLoading();
            case BaseState.error:
              return const AppError();
            case BaseState.done:
              return const SizedBox();
          }
        },
      )),
    );
  }
}
