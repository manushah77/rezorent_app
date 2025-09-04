import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rezorent_app/app/config/app_routes.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';
import 'package:rezorent_app/app/mvvm/view_model/auth_controllers/sign_up_controller.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';
import '../../../config/utils.dart';
import '../../../custom_widgets/app_custom_button.dart';
import '../../../custom_widgets/app_custom_field.dart';
import '../../../custom_widgets/custom_back_button.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final SignUpController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      body: Column(
        children: [
          50.h.height,
          Align(alignment: Alignment.centerLeft, child: CustomBackButton(isWhite: true)).paddingLeft(20.w),
          10.h.height,
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Create Your Account',
              style: AppTextStyles.customText28(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'MontDark'),
            ).animate(delay: 400.ms).fadeIn(duration: 500.ms).slideX(begin: -0.3, end: 0).paddingLeft(20.w),
          ),
          3.h.height,
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Sign up to explore and book the best hotel rooms and car rentals all in one place.',
              style: AppTextStyles.customText12(color: Color(0xff0C1D24), fontWeight: FontWeight.w500),
            ).animate(delay: 500.ms).fadeIn(duration: 500.ms).slideX(begin: -0.3, end: 0).paddingHorizontal(20.w).paddingRight(30.w),
          ),
          70.h.height,
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(33.sp), topRight: Radius.circular(33.sp)),
                  ),
                  child: SafeArea(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          // --- Email Field ---
                          AppCustomField(
                            labelTitle: 'First Name',
                            hintText: 'Enter First your Name',
                            prefixIcon: SvgPicture.asset(AppAssets.nameFieldIcon).paddingFromAll(10.sp),
                          ).animate(delay: 600.ms).fadeIn(duration: 400.ms).slideY(begin: 0.2, end: 0),
                          15.h.height,
                          AppCustomField(
                            labelTitle: 'Last Name',
                            hintText: 'Enter Last your Name',
                            prefixIcon: SvgPicture.asset(AppAssets.nameFieldIcon).paddingFromAll(10.sp),
                          ).animate(delay: 600.ms).fadeIn(duration: 400.ms).slideY(begin: 0.2, end: 0),
                          15.h.height,
                          AppCustomField(
                            labelTitle: 'Email Address',
                            hintText: 'Enter your email address',
                            prefixIcon: SvgPicture.asset(AppAssets.emailFieldIcon).paddingFromAll(10.sp),
                          ).animate(delay: 600.ms).fadeIn(duration: 400.ms).slideY(begin: 0.2, end: 0),
                          15.h.height,
                          Obx(
                            () => AppCustomField(
                              labelTitle: "Password",
                              hintText: "Enter Password Here",
                              prefixIcon: SvgPicture.asset(AppAssets.passwordFieldIcon).paddingFromAll(10.sp),
                              obscureText: controller.obscureText.value,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  controller.obscureText.value = !controller.obscureText.value;
                                },
                                child: Image.asset(
                                  controller.obscureText.value ? AppAssets.visibilityOff : AppAssets.visibilityOn,
                                  height: 15.h,
                                ).paddingFromAll(12.sp),
                              ),
                            ).animate(delay: 600.ms).fadeIn(duration: 400.ms).slideY(begin: 0.2, end: 0),
                          ),
                          15.h.height,
                          Obx(
                            () => AppCustomField(
                              labelTitle: "Confirm Password",
                              hintText: "Confirm Your Password",
                              prefixIcon: SvgPicture.asset(AppAssets.passwordFieldIcon).paddingFromAll(10.sp),
                              obscureText: controller.confirmObscureText.value,
                              textInputAction: TextInputAction.done,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  controller.confirmObscureText.value = !controller.confirmObscureText.value;
                                },
                                child: Image.asset(
                                  controller.confirmObscureText.value ? AppAssets.visibilityOff : AppAssets.visibilityOn,
                                  height: 15.h,
                                ).paddingFromAll(12.sp),
                              ),
                            ).animate(delay: 600.ms).fadeIn(duration: 400.ms).slideY(begin: 0.2, end: 0),
                          ),

                          25.h.height,
                          AppCustomButton(
                                title: 'Sign Up',
                                onPressed: () {
                                  Get.offAllNamed(AppRoutes.loginView);
                                },
                              )
                              .paddingHorizontal(30.w)
                              .animate(delay: 700.ms)
                              .fadeIn(duration: 300.ms)
                              .scale(begin: Offset(0.9, 0.9), end: Offset(1, 1), curve: Curves.easeOutBack, duration: 400.ms),
                          10.h.height,
                          // --- Sign Up Row ---
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?  ",
                                style: AppTextStyles.customText14(color: Colors.black, fontWeight: FontWeight.w400),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Text(
                                  "Log In",
                                  style: AppTextStyles.customText16(color: Color(0xff239EFE), fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ).animate(delay: 1000.ms).fadeIn(duration: 500.ms).slideY(begin: 0.2, end: 0),
                          25.h.height,
                        ],
                      ).paddingHorizontal(15.w),
                    ).paddingTop(50.h),
                  ),
                ),
                Positioned(
                  top: -55.h,
                  child: Stack(
                    alignment: Alignment(0, 1.3),
                    children: [
                      Obx(() {
                        return Container(
                          height: 110.sp,
                          width: 110.sp,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                            border: Border.all(color: Color(0xffE6E7E9)),
                            image: DecorationImage(
                              image: controller.rXfile.value == null ? AssetImage(AppAssets.placeholderMan) : FileImage(controller.rXfile.value!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ).animate().scale(begin: Offset(0.8, 0.8), end: Offset(1, 1), curve: Curves.easeOutBack, duration: 400.ms).fadeIn(duration: 300.ms);
                      }),

                      GestureDetector(
                        onTap: () {
                          Utils.showPickImageOptionsDialog(
                            context,
                            onCameraTap: () async {
                              Navigator.of(context).pop();
                              await controller.pickImageFromCamera();
                            },
                            onGalleryTap: () async {
                              Navigator.of(context).pop();
                              await controller.pickImageFromGallery();
                            },
                          );
                        },
                        child: SvgPicture.asset(AppAssets.cameraIcon),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
