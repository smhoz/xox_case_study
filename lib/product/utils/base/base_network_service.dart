
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BaseNetworkService extends GetxService {
  Dio? dio = Dio(BaseOptions(
    baseUrl: "",
    headers: {'Content-type': 'application/json', 'Accept': 'application/json'},
    receiveTimeout: const Duration(seconds: 15),
    connectTimeout: const Duration(seconds: 15),
  ));
}
