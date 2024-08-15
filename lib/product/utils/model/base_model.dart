import 'a_base_model.dart';

class BaseModel extends ABaseModel {
  @override
  dynamic data;
  @override
  int? status;
  @override
  String? message;

  BaseModel({this.data, this.message, this.status});

  BaseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    status = json['status'];
    message = json['message'];
  }
}
