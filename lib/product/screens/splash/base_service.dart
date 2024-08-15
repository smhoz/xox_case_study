import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../utils/constants/endpoints.dart';
import '../../utils/model/error_model.dart';
import '../../utils/model/user_model.dart';

import '../../utils/model/a_base_model.dart';
import '../../utils/model/base_model.dart';

class BaseService extends GetxService {
  Future<ABaseModel> signInAnonymously() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
      return UserModel(data: userCredential.user);
    } catch (e) {
      return ErrorModel(data: e);
    }
  }

  Future<ABaseModel> saveUsersCollection({required UserModel user}) async {
    try {
      //If document not exits
      if (!((await FirebaseFirestore.instance.collection(Endpoint.users.path).doc(user.data?.uid).get()).exists)) {
        await FirebaseFirestore.instance.collection(Endpoint.users.path).doc(user.data?.uid).set(user.toJson());
        return BaseModel(status: HttpStatus.ok);
      } else {
        return BaseModel(status: HttpStatus.ok);
      }
    } catch (e) {
      return ErrorModel(data: e);
    }
  }
}
