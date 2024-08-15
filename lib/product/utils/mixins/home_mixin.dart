import 'package:flutter/material.dart';

import '../../../core/widgets/app_dialog.dart';
import '../../../core/widgets/app_text_form_field.dart';
import '../../screens/home/home_controller.dart';

mixin HomeDialog {
  void gameNameShowDialog(BuildContext context, HomeController controller) {
    showDialog(
        context: context,
        builder: (context) => AppDialog(
              title: "Oyun İsmi Giriniz",
              isOkButtonOnPressed: () => controller.createdGame,
              contentChild: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Form(
                    key: controller.formKey,
                    child: AppTextFormField(controller: controller.gameNameController, hintText: "Oyun İsmi Giriniz"),
                  ),
                ],
              ),
            ));
  }

  void nameShowDialog(BuildContext context, HomeController controller) {
    if ((controller.userModel?.name ?? "").isEmpty) {
      showDialog(
          context: context,
          builder: (context) => AppDialog(
                title: "Oyuna Katılmak için isim girmeniz gerekiyor",
                isOkButtonOnPressed: () => controller.saveName,
                contentChild: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Form(
                      key: controller.formKey,
                      child: AppTextFormField(controller: controller.nameController, hintText: "İsim Giriniz"),
                    ),
                  ],
                ),
              ));
    }
  }
}
