import 'package:get/get.dart';
import '../../../core/route/app_routes.dart';
import '../../utils/model/user_model.dart';
import 'base_service.dart';

import '../../utils/model/base_model.dart';

enum BaseState { initial, loading, error, done }

class BaseController extends GetxController {
  BaseService service = Get.find<BaseService>();

  final Rx<BaseState> _state = BaseState.initial.obs;
  BaseState get state => _state.value;
  set state(BaseState val) => _state.value = val;

  UserModel? userModel;

  @override
  void onInit() {
    signInAnonymously();
    super.onInit();
  }

  void signInAnonymously() async {
    state = BaseState.loading;
    final response = await service.signInAnonymously();

    if (response is UserModel) {
      userModel = response;
      saveUsersCollection();
      state = BaseState.done;
      return;
    } else {
      state = BaseState.error;
      return;
    }
  }

  void saveUsersCollection() async {
    if (userModel == null) return;
    state = BaseState.loading;
    final response = await service.saveUsersCollection(user: userModel!);
    if (response is BaseModel) {
      state = BaseState.done;
      Get.offAllNamed(Routes.home);
      return;
    } else {
      state = BaseState.error;
      return;
    }
  }
}
