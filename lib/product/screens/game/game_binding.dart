import 'package:get/get.dart';
import 'game_service.dart';

import 'game_controller.dart';

class GameBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameService>(() => GameService());
    Get.lazyPut<GameController>(() => GameController());
  }
}
