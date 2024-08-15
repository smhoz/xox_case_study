import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../core/extensions/get_interface_extension.dart';
import '../../utils/model/user_model.dart';
import 'home_service.dart';
import '../../utils/widgets/app_snackbar.dart';

import '../../utils/model/base_model.dart';
import '../../utils/model/game_model.dart';

enum HomeState { initial, loading, error, done }

class HomeController extends GetxController {
  HomeService service = Get.find<HomeService>();

  final Rx<HomeState> _state = HomeState.initial.obs;
  HomeState get state => _state.value;
  set state(HomeState val) => _state.value = val;

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController gameNameController = TextEditingController();

  UserModel? userModel;

  final RxList<GameData> _gameDatas = <GameData>[].obs;
  List<GameData> get gameDatas => _gameDatas;
  set gameDatas(List<GameData> val) => _gameDatas.value = val;

  @override
  void onInit() {
    ever(_state, (HomeState value) {
      switch (value) {
        case HomeState.loading:
          Get.showProgressDialog();
          break;
        case HomeState.done:
          if (!Get.isOverlaysClosed) Get.back();
          break;
        case HomeState.error:
          if (!Get.isOverlaysClosed) Get.back();
          break;
        default:
      }
    });

    super.onInit();
  }

  @override
  void onReady() {
    getUser;
    getGames;
    super.onReady();
  }

  void get getUser async {
    state = HomeState.loading;
    final response = await service.getUser;
    if (response is UserModel) {
      userModel = response;
      state = HomeState.done;
      getGames;
      return;
    } else {
      state = HomeState.error;
      return;
    }
  }

  void get getGames async {
    final response = service.getGames;

    response.listen(
      (event) {
        gameDatas.clear();
        for (var element in event.docs) {
          gameDatas.add(GameData.fromJson(element.data()));
        }
      },
    );
  }

  void get createdGame async {
    if (userModel == null) return;
    state = HomeState.loading;
    final response = await service.createdGame(name: gameNameController.text);
    if (response is BaseModel) {
      state = HomeState.done;
      Get.back();
      return;
    } else {
      state = HomeState.error;
      return;
    }
  }

  void get saveName async {
    if (!(formKey.currentState?.validate() ?? true)) return;
    state = HomeState.loading;
    final response = await service.saveName(name: nameController.text);
    if (response is BaseModel) {
      state = HomeState.done;
      userModel?.name = nameController.text;
      Get.back();
      AppSnackbar.instance.succesSaveName;
      return;
    } else {
      state = HomeState.error;
      return;
    }
  }
}
