import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rezorent_app/app/mvvm/view_model/auth_controllers/login_controller.dart';
import 'package:rezorent_app/app/mvvm/view_model/auth_controllers/sign_up_controller.dart';
import 'package:rezorent_app/app/mvvm/view_model/booking_details/booking_details_controller.dart';
import 'package:rezorent_app/app/mvvm/view_model/bottom_bar_controller/bottom_bar_controller.dart';
import 'package:rezorent_app/app/mvvm/view_model/home_controller/home_controller.dart';
import 'package:rezorent_app/app/mvvm/views/bottom_bar_view/bottom_bar_view.dart';
import 'package:rezorent_app/app/mvvm/views/delete_account_view/delete_account_view.dart';
import 'package:rezorent_app/app/mvvm/views/edit_profile_view/edit_profile_view.dart';
import 'package:rezorent_app/app/mvvm/views/forgot_pass_view/forgot_pass_view.dart';
import 'package:rezorent_app/app/mvvm/views/hotel_details_view/hotel_details_view.dart';
import 'package:rezorent_app/app/mvvm/views/login_view/login_view.dart';
import 'package:rezorent_app/app/mvvm/views/notification_view/notification_view.dart';
import 'package:rezorent_app/app/mvvm/views/sign_up_view/sign_up_view.dart';
import 'package:rezorent_app/app/mvvm/views/splash_views/splash_view.dart';

import '../mvvm/view_model/car_rental_details/car_rental_details_controller.dart';
import '../mvvm/view_model/payment_controller/payment_controller.dart';
import '../mvvm/views/about_us_view/about_us_view.dart';
import '../mvvm/views/booking_details/booking_details_view.dart';
import '../mvvm/views/car_rental_details/car_rental_details_view.dart';
import '../mvvm/views/get_started_view/get_started_vew.dart';
import '../mvvm/views/payment_view/payment_view.dart';
import '../mvvm/views/privacy_policy_view/privacy_policy_view.dart';
import '../mvvm/views/room_details_view/room_details_view.dart';
import '../mvvm/views/select_car/select_car_view.dart';
import '../mvvm/views/select_room_view/select_room_view.dart';
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
  static const notificationView = '/notificationView';
  static const carRentalDetailsView = '/carRentalDetailsView';
  static const hotelDetailsView = '/hotelDetailsView';
  static const selectCarView = '/selectCarView';
  static const bookingDetailsView = '/bookingDetailsView';

  static const selectRoomView = '/selectRoomView';
  static const roomDetailsView = '/roomDetailsView';
  static const paymentView = '/paymentView';

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
      name: AppRoutes.notificationView,
      page: () => NotificationsView(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<SignUpController>(() => SignUpController());
      }),
    ),

    GetPage(
      name: AppRoutes.bottomBarView,
      page: () => BottomBarView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<BottomBarController>(() => BottomBarController());
        Get.lazyPut<HomeController>(() => HomeController());
      }),
    ),

    GetPage(
      name: AppRoutes.carRentalDetailsView,
      page: () => CarRentalDetailsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<CarRentalDetailsController>(() => CarRentalDetailsController());
        // Get.lazyPut<HomeController>(() => HomeController());
      }),
    ),
    GetPage(
      name: AppRoutes.hotelDetailsView,
      page: () => HotelDetailsView(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<CarRentalDetailsController>(() => CarRentalDetailsController());
      }),
    ),
    GetPage(
      name: AppRoutes.selectCarView,
      page: () => SelectCarView(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<CarRentalDetailsController>(() => CarRentalDetailsController());
      }),
    ),
    GetPage(
      name: AppRoutes.bookingDetailsView,
      page: () => BookingDetailsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<BookingDetailsController>(() => BookingDetailsController());
      }),
    ),


    GetPage(
      name: AppRoutes.selectRoomView,
      page: () => SelectRoomView(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<CarRentalDetailsController>(() => CarRentalDetailsController());
      }),
    ),
    GetPage(
      name: AppRoutes.roomDetailsView,
      page: () => RoomDetailsView(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<CarRentalDetailsController>(() => CarRentalDetailsController());
      }),
    ),
    GetPage(
      name: AppRoutes.paymentView,
      page: () => PaymentView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<PaymentController>(() => PaymentController());
      }),
    ),
  ];
}
