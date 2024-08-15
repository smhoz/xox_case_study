import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../core/route/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_border_radius.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_sizedbox.dart';
import '../../utils/mixins/home_mixin.dart';
import '../../utils/model/game_model.dart';
import 'home_controller.dart';

part 'widget/home_games_list.dart';

class HomeView extends GetView<HomeController> with HomeDialog {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Oyun Alanı')),
      body: Padding(
        padding: context.paddingMedium,
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppButton(onPressed: () => gameNameShowDialog(context, controller), text: "Oyun Oluştur"),
              const HomeGamesList(),
            ],
          ),
        ),
      ),
    );
  }
}
