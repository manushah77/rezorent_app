import 'package:get/get.dart';
import 'package:rezorent_app/app/mvvm/view_model/auth_controllers/login_controller.dart';
import 'package:rezorent_app/app/mvvm/view_model/auth_controllers/sign_up_controller.dart';
import 'package:rezorent_app/app/mvvm/view_model/bottom_bar_controller/bottom_bar_controller.dart';
import 'package:rezorent_app/app/mvvm/views/bottom_bar_view/bottom_bar_view.dart';
import 'package:rezorent_app/app/mvvm/views/forgot_pass_view/forgot_pass_view.dart';
import 'package:rezorent_app/app/mvvm/views/login_view/login_view.dart';
import 'package:rezorent_app/app/mvvm/views/sign_up_view/sign_up_view.dart';
import 'package:rezorent_app/app/mvvm/views/splash_views/splash_view.dart';

import '../mvvm/views/get_started_view/get_started_vew.dart';

/// Defines navigation routes for the LayerX app.
abstract class AppRoutes {
  AppRoutes._();

  static const splashView = '/splashView';
  static const getStartedView = '/getStartedView';
  static const loginView = '/loginView';
  static const signUpView = '/signUpView';
  static const forgotPassView = '/forgotPassView';
  static const bottomBarView = '/bottomBarView';
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
    GetPage(
      name: AppRoutes.forgotPassView,
      page: () => ForgotPassView(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<LoginController>(() => LoginController());
      }),
    ),
    GetPage(
      name: AppRoutes.signUpView,
      page: () => SignUpView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SignUpController>(() => SignUpController());
      }),
    ),
    GetPage(
      name: AppRoutes.bottomBarView,
      page: () => BottomBarView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<BottomBarController>(() => BottomBarController());
      }),
    ),
  ];
}
