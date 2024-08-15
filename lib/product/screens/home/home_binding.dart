import 'package:get/get.dart';
import 'home_service.dart';

import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeService());
    Get.put(HomeController());
  }
}
