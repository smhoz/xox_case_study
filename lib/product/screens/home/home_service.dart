import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../../utils/constants/endpoints.dart';
import '../../utils/model/a_base_model.dart';
import '../../utils/model/base_model.dart';
import '../../utils/model/error_model.dart';
import '../../utils/model/user_model.dart';

class HomeService extends GetxService {
  var uuid = const Uuid();

  Future<ABaseModel> createdGame({String? name}) async {
    try {
      final uid = uuid.v1();
      await FirebaseFirestore.instance.collection(Endpoint.games.path).doc(uid).set({
        "name" : name,
        "id": uid,
        "displayXO": [
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
        "users": [],
        "oTurn": false,
      });

      return BaseModel(status: HttpStatus.ok);
    } catch (e) {
      return ErrorModel(data: e);
    }
  }

  Future<ABaseModel> get getUser async {
    try {
      DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore.instance
          .collection(Endpoint.users.path)
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get();
      return UserModel.fromJson(doc.data() ?? {});
    } catch (e) {
      return ErrorModel(data: e);
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get getGames {
    return FirebaseFirestore.instance.collection(Endpoint.games.path).snapshots();
  }

  Future<ABaseModel> saveName({String? name}) async {
    try {
      await FirebaseFirestore.instance
          .collection(Endpoint.users.path)
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({"name": name});

      return BaseModel(status: HttpStatus.ok);
    } catch (e) {
      return ErrorModel(data: e);
    }
  }
}
