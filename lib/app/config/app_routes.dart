import 'package:get/get.dart';
import 'package:rezorent_app/app/mvvm/view_model/auth_controllers/login_controller.dart';
import 'package:rezorent_app/app/mvvm/views/login_view/login_view.dart';
import 'package:rezorent_app/app/mvvm/views/splash_views/splash_view.dart';

import '../mvvm/views/get_started_view/get_started_vew.dart';

/// Defines navigation routes for the LayerX app.
abstract class AppRoutes {
  AppRoutes._();

  static const splashView = '/splashView';
  static const getStartedView = '/getStartedView';
  static const loginView = '/loginView';

}

abstract class AppPages {
  AppPages._();

  static final routes = <GetPage>[
    GetPage(
      name: AppRoutes.splashView,
      page: () => SplashView(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<SplashController>(() => SplashController());
      }),
    ),
    GetPage(
      name: AppRoutes.getStartedView,
      page: () => GetStartedView(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<SplashController>(() => SplashController());
      }),
    ),
    GetPage(
      name: AppRoutes.loginView,
      page: () => LoginView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LoginController>(() => LoginController());
      }),
    ),
  ];
}
