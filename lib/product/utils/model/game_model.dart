import 'a_base_model.dart';

class GameModel extends ABaseModel {
  List<GameData>? games;

  GameModel({this.games});
}

class GameData {
  String? id;
  String? name;
  bool? oTurn;
  String? resultDeclaration;
  List<dynamic>? users;
  List<dynamic>? displayXO;

  GameData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    users = json["users"];
    displayXO = json["displayXO"];
    oTurn = json["oTurn"];
    resultDeclaration = json["resultDeclaration"];
  }
}
