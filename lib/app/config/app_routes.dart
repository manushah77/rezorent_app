import 'package:get/get.dart';

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
      page: () => SplashViewOne(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<SplashController>(() => SplashController());
      }),
    ),
  ];
}
