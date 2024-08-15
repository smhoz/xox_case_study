import 'package:firebase_auth/firebase_auth.dart';

import 'a_base_model.dart';

class UserModel extends ABaseModel<User> {
  @override
  User? data;

  String? name;
  String? id;

  UserModel({this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> toData = <String, dynamic>{};
    toData['id'] = data?.uid;

    return toData;
  }
}
