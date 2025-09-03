import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rezorent_app/app/config/app_colors.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/custom_widgets/app_custom_button.dart';
import 'package:rezorent_app/app/custom_widgets/app_custom_field.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_text_style.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              90.h.height,
              // 🌟 Main Logo Animation
              Align(
                alignment: Alignment.center,
                child: Image.asset(AppAssets.appNameIcon, height: 50.h)
                    .animate()
                    .fadeIn(duration: 1000.ms, curve: Curves.easeInOut)
                    .scale(begin: const Offset(0.6, 0.6), end: const Offset(1.0, 1.0), duration: 900.ms, curve: Curves.easeOutBack)
                    .then(delay: 400.ms)
                    .shake(duration: 800.ms, hz: 2, curve: Curves.easeInOut),
              ),
              1.h.height,
              // 🌟 Tagline Animation
              Text(
                    "Tag line here",
                    style: AppTextStyles.customText14(color: const Color(0xB2FFFFFF), fontWeight: FontWeight.w500, letterSpacing: 5),
                  )
                  .animate(delay: 1600.ms) // after logo animation
                  .fadeIn(duration: 1000.ms)
                  .slide(begin: const Offset(0, 0.4), end: Offset.zero, curve: Curves.easeOut),
              60.h.height,
            ],
          ),

          // 🌟 Expanded Containers Section
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // 🔹 Blurred/White transparent container expanding fully
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(25.sp), topRight: Radius.circular(25.sp)),
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ).paddingHorizontal(10.w).animate().fadeIn(duration: 800.ms).slideY(begin: 1, end: 0),
                ),

                // 🔹 Main White container (Login Form)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(25.sp), topLeft: Radius.circular(25.sp)),
                      color: Colors.white,
                    ),
                    child: SafeArea(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Text(
                              'Welcome Back!',
                              style: AppTextStyles.customText24(color: AppColors.textDarkColor, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Log in to book your next ride or hotel stay in just a few clicks',
                              style: AppTextStyles.customText12(color: AppColors.textDarkColor),
                            ),
                            20.h.height,
                            AppCustomField(
                              labelTitle: 'Email Address',
                              hintText: 'Enter Email',
                              prefixIcon: SvgPicture.asset(AppAssets.emailFieldIcon).paddingFromAll(10.sp),
                            ),
                            10.h.height,
                            AppCustomField(
                              labelTitle: 'Password',
                              hintText: 'Enter Password',
                              prefixIcon: SvgPicture.asset(AppAssets.passwordFieldIcon).paddingFromAll(10.sp),
                            ),
                            10.h.height,
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Forgot Password?',
                                style: AppTextStyles.customText14(color: const Color(0xff515151), fontWeight: FontWeight.w500),
                              ),
                            ),
                            70.h.height,
                            AppCustomButton(title: 'Log in', onPressed: () {}).paddingHorizontal(15.w),
                            15.h.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have an account? ", style: AppTextStyles.customText14(color: AppColors.textDarkColor)),
                                Text(
                                  "Register",
                                  style: AppTextStyles.customText16(color: const Color(0xff239EFE), fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            30.h.height,
                          ],
                        ).paddingFromAll(15.sp),
                      ),
                    ),
                  ).paddingTop(10.h).animate().fadeIn(duration: 1000.ms).slideY(begin: 1, end: 0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
