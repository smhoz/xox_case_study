import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'product/utils/base/init_main.dart';
import 'product/screens/splash/base_binding.dart';

import 'core/route/app_route_view.dart';
import 'core/route/app_routes.dart';
import 'core/theme/app_themes.dart';
import 'product/utils/constants/app_constants.dart';

void main() async {
  await InitMain.initApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.instance.appName,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      darkTheme: AppThemes.dark,
      themeMode: ThemeMode.dark,
      enableLog: kDebugMode ? true : false,
      initialRoute: Routes.base,
      initialBinding: BaseBinding(),
      theme: AppThemes.light,
      getPages: AppViews.pages,
    );
  }
}
