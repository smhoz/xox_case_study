import 'package:get/get.dart';
import '../../../core/extensions/get_interface_extension.dart';
import 'game_service.dart';
import '../home/home_controller.dart';
import '../../utils/model/base_model.dart';
import '../../utils/model/game_model.dart';
import '../../utils/widgets/app_snackbar.dart';

enum GameState { initial, loading, error, done }

class GameController extends GetxController {
  GameService service = Get.find<GameService>();
  HomeController homeController = Get.find<HomeController>();

  final Rx<GameState> _state = GameState.done.obs;
  GameState get state => _state.value;
  set state(GameState val) => _state.value = val;

  bool oTurn = true;
  final RxList<dynamic> _displayXO = <dynamic>[].obs;
  List<dynamic> get displayXO => _displayXO;
  set displayXO(List<dynamic> val) => _displayXO.value = val;

  List<int> matchedIndexes = [];
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  bool winnerFound = false;

  final Rx<String> _resultDeclaration = ''.obs;
  String get resultDeclaration => _resultDeclaration.value;
  set resultDeclaration(String val) => _resultDeclaration.value = val;

  final Rx<GameData?> _gameData = Rx(null);
  GameData? get gameData => _gameData.value;
  set gameData(GameData? val) => _gameData.value = val;

  final RxList<dynamic> _users = <dynamic>[].obs;
  List<dynamic> get users => _users;
  set users(List<dynamic> val) => _users.value = val;

  @override
  void onInit() {
    ever(_state, (GameState value) {
      switch (value) {
        case GameState.loading:
          Get.showProgressDialog();
          break;
        case GameState.done:
          if (!Get.isOverlaysClosed) Get.back();
          break;
        case GameState.error:
          if (!Get.isOverlaysClosed) Get.back();
          break;
        default:
      }
    });

    super.onInit();
  }

  @override
  void onReady() {
    if (Get.arguments != null) gameData = Get.arguments["gameData"];
    updatedGameUser;
    getGameUser;
    super.onReady();
  }

  @override
  void onClose() {
    service.removedGameUser(id: gameData?.id, name: homeController.userModel?.name);
    super.onClose();
  }

  void get updatedGameUser async {
    state = GameState.loading;
    if (gameData == null) return;
    final response = await service.updatedGameUser(id: gameData?.id, name: homeController.userModel?.name);
    if (response is BaseModel) {
      state = GameState.done;
    } else {
      state = GameState.error;
    }
  }

  void get getGameUser async {
    if (gameData == null) return;
    service.getGameUser(id: gameData?.id).listen(
      (event) {
        GameData gameData = GameData.fromJson(event.data() ?? {});
        users = gameData.users ?? [];
        displayXO = gameData.displayXO ?? [];
        oTurn = gameData.oTurn ?? false;
        resultDeclaration = gameData.resultDeclaration != null ? (!oTurn ? users[0] : users[1]) + " WIN" : "";
        _displayXO.refresh();
      },
    );
  }

  void _checkWinner() {
    if (displayXO[0] == displayXO[1] && displayXO[0] == displayXO[2] && displayXO[0] != '') {
      resultDeclaration = '${displayXO[0]}';
      matchedIndexes.addAll([0, 1, 2]);
      _updateScore(displayXO[0]);
    }

    if (displayXO[3] == displayXO[4] && displayXO[3] == displayXO[5] && displayXO[3] != '') {
      resultDeclaration = '${displayXO[3]}';
      matchedIndexes.addAll([3, 4, 5]);
      _updateScore(displayXO[3]);
    }

    if (displayXO[6] == displayXO[7] && displayXO[6] == displayXO[8] && displayXO[6] != '') {
      resultDeclaration = '${displayXO[6]}';
      matchedIndexes.addAll([6, 7, 8]);
      _updateScore(displayXO[6]);
    }

    if (displayXO[0] == displayXO[3] && displayXO[0] == displayXO[6] && displayXO[0] != '') {
      resultDeclaration = '${displayXO[0]}';
      matchedIndexes.addAll([0, 3, 6]);
      _updateScore(displayXO[0]);
    }

    if (displayXO[1] == displayXO[4] && displayXO[1] == displayXO[7] && displayXO[1] != '') {
      resultDeclaration = '${displayXO[1]}';
      matchedIndexes.addAll([1, 4, 7]);
      _updateScore(displayXO[1]);
    }

    if (displayXO[2] == displayXO[5] && displayXO[2] == displayXO[8] && displayXO[2] != '') {
      resultDeclaration = '${displayXO[2]}';
      matchedIndexes.addAll([2, 5, 8]);
      _updateScore(displayXO[2]);
    }

    if (displayXO[0] == displayXO[4] && displayXO[0] == displayXO[8] && displayXO[0] != '') {
      resultDeclaration = '${displayXO[0]}';
      matchedIndexes.addAll([0, 4, 8]);
      _updateScore(displayXO[0]);
    }

    if (displayXO[6] == displayXO[4] && displayXO[6] == displayXO[2] && displayXO[6] != '') {
      resultDeclaration = '${displayXO[6]}';
      matchedIndexes.addAll([6, 4, 2]);
      _updateScore(displayXO[6]);
    }
    if (!winnerFound && filledBoxes == 9) {
      resultDeclaration = 'Nobody Wins!';
    }

    if ((resultDeclaration.trim()).isNotEmpty) {
      service.updatedGame(id: gameData?.id, resultDeclaration: resultDeclaration);
      _clearBoard();
    }
  }

  void _updateScore(String winner) {
    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    }
    winnerFound = true;
  }

  void tapped(int index) {
    if (users.length == 1) {
      AppSnackbar.instance.errorUserLimitGame;
      return;
    }
    if (users[0] == homeController.userModel?.name && !oTurn) {
      AppSnackbar.instance.errorUserGame;
      return;
    }
    if (users[1] == homeController.userModel?.name && oTurn) {
      AppSnackbar.instance.errorUserGame;
      return;
    }

    if (oTurn && displayXO[index] == ' ') {
      displayXO[index] = 'O';
      filledBoxes++;
    } else if (!oTurn && displayXO[index] == ' ') {
      displayXO[index] = 'X';
      filledBoxes++;
    }

    oTurn = !oTurn;
    service.updatedGame(id: gameData?.id, value: displayXO, oTurn: oTurn);
    _checkWinner();
    _displayXO.refresh();
  }

  void _clearBoard() {
    resultDeclaration = '';
    matchedIndexes = [];
    filledBoxes = 0;
  }
}
