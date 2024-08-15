import 'a_base_model.dart';

class ErrorModel extends ABaseModel {
  @override
  int? status;
  @override
  dynamic data;
  ErrorModel({this.status, this.data});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    data = json["data"];
    status = json['status'];
  }
}
