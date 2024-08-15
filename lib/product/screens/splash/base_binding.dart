import 'package:get/get.dart';
import 'base_service.dart';

import 'base_controller.dart';

class BaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseService>(() =>BaseService());
    Get.lazyPut<BaseController>(() => BaseController());
  }
}
