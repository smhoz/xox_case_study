import 'package:get/get.dart';
import 'app_routes.dart';
import '../../product/screens/game/game_binding.dart';
import '../../product/screens/game/game_view.dart';

import '../../product/screens/home/home_binding.dart';
import '../../product/screens/home/home_view.dart';
import '../../product/screens/splash/base_binding.dart';
import '../../product/screens/splash/base_view.dart';

class AppViews {
  static final pages = [
    GetPage(
      name: Routes.base,
      transition: Transition.rightToLeft,
      page: () => const BaseView(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: Routes.home,
      transition: Transition.rightToLeft,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.game,
      transition: Transition.rightToLeft,
      page: () => const GameView(),
      binding: GameBinding(),
    ),
  ];
}
