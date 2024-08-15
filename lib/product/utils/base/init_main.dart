import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../firebase_options.dart';
import 'base_network_service.dart';

class InitMain {
  static Future<void> initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    Get.put(BaseNetworkService());
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }
}
