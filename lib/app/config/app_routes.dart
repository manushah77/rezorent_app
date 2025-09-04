import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rezorent_app/app/mvvm/view_model/auth_controllers/login_controller.dart';
import 'package:rezorent_app/app/mvvm/view_model/auth_controllers/sign_up_controller.dart';
import 'package:rezorent_app/app/mvvm/view_model/bottom_bar_controller/bottom_bar_controller.dart';
import 'package:rezorent_app/app/mvvm/views/bottom_bar_view/bottom_bar_view.dart';
import 'package:rezorent_app/app/mvvm/views/delete_account_view/delete_account_view.dart';
import 'package:rezorent_app/app/mvvm/views/edit_profile_view/edit_profile_view.dart';
import 'package:rezorent_app/app/mvvm/views/forgot_pass_view/forgot_pass_view.dart';
import 'package:rezorent_app/app/mvvm/views/login_view/login_view.dart';
import 'package:rezorent_app/app/mvvm/views/sign_up_view/sign_up_view.dart';
import 'package:rezorent_app/app/mvvm/views/splash_views/splash_view.dart';

import '../mvvm/views/about_us_view/about_us_view.dart';
import '../mvvm/views/get_started_view/get_started_vew.dart';
import '../mvvm/views/privacy_policy_view/privacy_policy_view.dart';
import '../mvvm/views/terms_and_condition_view/terms_and_condition_view.dart';

/// Defines navigation routes for the LayerX app.
abstract class AppRoutes {
  AppRoutes._();

  static const splashView = '/splashView';
  static const getStartedView = '/getStartedView';
  static const loginView = '/loginView';
  static const signUpView = '/signUpView';
  static const forgotPassView = '/forgotPassView';
  static const bottomBarView = '/bottomBarView';
  static const editProfileView = '/editProfileView';
  static const deleteAccountView = '/deleteAccountView';
  static const aboutUsView = '/aboutUsView';
  static const privacyPolicyView = '/privacyPolicyView';
  static const termsAndConditionView = '/termsAndConditionView';
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
      name: AppRoutes.editProfileView,
      page: () => EditProfileView(),
      binding: BindingsBuilder(() {
        //Get.lazyPut<SignUpController>(() => SignUpController());
      }),
    ),
    GetPage(
      name: AppRoutes.deleteAccountView,
      page: () => DeleteAccountView(),
      binding: BindingsBuilder(() {
       // Get.lazyPut<SignUpController>(() => SignUpController());
      }),
    ),
    GetPage(
      name: AppRoutes.aboutUsView,
      page: () => AboutUsView(),
      binding: BindingsBuilder(() {
      //  Get.lazyPut<SignUpController>(() => SignUpController());
      }),
    ),
    GetPage(
      name: AppRoutes.privacyPolicyView,
      page: () => PrivacyPolicyView(),
      binding: BindingsBuilder(() {
      //  Get.lazyPut<SignUpController>(() => SignUpController());
      }),
    ),
    GetPage(
      name: AppRoutes.termsAndConditionView,
      page: () => TermsAndConditionView(),
      binding: BindingsBuilder(() {
       // Get.lazyPut<SignUpController>(() => SignUpController());
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
