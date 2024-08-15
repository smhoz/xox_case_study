import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/widgets/app_border_radius.dart';

import '../../../core/theme/app_colors.dart';
import 'game_controller.dart';

part 'widget/game_table_view.dart';
part 'widget/game_result_text.dart';
part 'widget/game_player_text.dart';

class GameView extends GetView<GameController> {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: context.paddingMedium,
            child: Column(
              children: [
                const GamePlayerText(),
                const GameTableView(),
                _ResultText(controller: controller),
              ],
            )));
  }
}
