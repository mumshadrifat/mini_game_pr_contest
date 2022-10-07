import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/question_screen/bindings/question_screen_binding.dart';
import '../modules/question_screen/views/question_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.QUESTION_SCREEN,
      page: () =>  QuestionScreenView(),
      binding: QuestionScreenBinding(),
    ),
  ];
}
