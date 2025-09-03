import 'package:get/get.dart';
import 'package:rezorent_app/app/mvvm/views/splash_views/splash_view_two.dart';

import '../mvvm/views/get_started_view/get_started_vew.dart';
import '../mvvm/views/splash_views/splash_view_one.dart';

/// Defines navigation routes for the LayerX app.
abstract class AppRoutes {
  AppRoutes._();

  static const splashOneView = '/splashOneView';
  static const splashTwoView = '/splashTwoView';
  static const getStartedView = '/getStartedView';

}

abstract class AppPages {
  AppPages._();

  static final routes = <GetPage>[
    GetPage(
      name: AppRoutes.splashOneView,
      page: () => SplashViewOne(),
      binding: BindingsBuilder(() {
       // Get.lazyPut<SplashController>(() => SplashController());
      }),
    ),
    GetPage(
      name: AppRoutes.splashTwoView,
      page: () => SplashViewTwo(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<SplashController>(() => SplashController());
      }),
    ),
    GetPage(
      name: AppRoutes.getStartedView,
      page: () => GetStartedVew(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<SplashController>(() => SplashController());
      }),
    ),
  ];
}
