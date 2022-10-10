import 'package:flutter/material.dart';

import 'package:get/get.dart';


import 'app/routes/app_pages.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //final prefs = await SharedPreferences.getInstance();
  //await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
     // builder: EasyLoading.init(),
    ),


  );
  configLoading();

  }
void configLoading() {
  // EasyLoading.instance
  //   ..displayDuration = const Duration(milliseconds: 2000)
  //   ..indicatorType = EasyLoadingIndicatorType.fadingCircle
  //   ..loadingStyle = EasyLoadingStyle.dark
  //   ..indicatorSize = 45.0
  //   ..radius = 10.0
  //   ..progressColor = Colors.yellow
  //   ..backgroundColor = Colors.green
  //   ..indicatorColor = Colors.yellow
  //   ..textColor = Colors.yellow
  //   ..maskColor = Colors.blue.withOpacity(0.5)
  //   ..userInteractions = true
  //   ..dismissOnTap = false
  //   ..indicatorType = EasyLoadingIndicatorType.cubeGrid
  //   ..maskType = EasyLoadingMaskType.black
  //   ..loadingStyle = EasyLoadingStyle.light;

}
