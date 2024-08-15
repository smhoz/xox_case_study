import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../utils/constants/endpoints.dart';
import '../../utils/model/a_base_model.dart';
import '../../utils/model/base_model.dart';
import '../../utils/model/error_model.dart';

class GameService extends GetxService {
  Future<ABaseModel> updatedGameUser({String? id, String? name}) async {
    try {
      await FirebaseFirestore.instance.collection(Endpoint.games.path).doc(id).update({
        "users": FieldValue.arrayUnion([name])
      });

      return BaseModel(status: HttpStatus.ok);
    } catch (e) {
      return ErrorModel(data: e);
    }
  }

  Future<ABaseModel> updatedGame({String? id, List<dynamic>? value, bool? oTurn, String? resultDeclaration}) async {
    try {
      await FirebaseFirestore.instance.collection(Endpoint.games.path).doc(id).update({
        "displayXO": value ??
            [
              ' ',
              ' ',
              ' ',
              ' ',
              ' ',
              ' ',
              ' ',
              ' ',
              ' ',
            ],
        "oTurn": oTurn,
        "resultDeclaration": resultDeclaration,
      });

      return BaseModel(status: HttpStatus.ok);
    } catch (e) {
      return ErrorModel(data: e);
    }
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getGameUser({String? id, String? name}) {
    return FirebaseFirestore.instance.collection(Endpoint.games.path).doc(id).snapshots();
  }

  Future<ABaseModel> removedGameUser({String? id, String? name}) async {
    try {
      await FirebaseFirestore.instance.collection(Endpoint.games.path).doc(id).update({
        "users": FieldValue.arrayRemove([name])
      });

      return BaseModel(status: HttpStatus.ok);
    } catch (e) {
      return ErrorModel(data: e);
    }
  }
}
