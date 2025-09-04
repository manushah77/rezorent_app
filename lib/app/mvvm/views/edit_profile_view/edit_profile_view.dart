import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';
import '../../../custom_widgets/app_custom_button.dart';
import '../../../custom_widgets/app_custom_field.dart';
import '../../../custom_widgets/custom_app_bar.dart';
import '../../../custom_widgets/custom_cache_image/custom_cached_image.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      appBar: CustomAppBar(
        title: "Edit Profile",
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              50.h.height,
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // ===== Profile Form Card =====
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 20.h,
                      horizontal: 16.w,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        56.h.height, // space for profile image overlap
                        AppCustomField(
                              labelTitle: 'First Name',
                              hintText: 'Enter your First Name',
                              prefixIcon: SvgPicture.asset(
                                AppAssets.nameFieldIcon,
                              ).paddingFromAll(10.sp),
                            )
                            .animate(delay: 600.ms)
                            .fadeIn(duration: 400.ms)
                            .slideY(begin: 0.2, end: 0),
                        15.h.height,
                        AppCustomField(
                              labelTitle: 'Last Name',
                              hintText: 'Enter your Last Name',
                              prefixIcon: SvgPicture.asset(
                                AppAssets.nameFieldIcon,
                              ).paddingFromAll(10.sp),
                            )
                            .animate(delay: 700.ms)
                            .fadeIn(duration: 400.ms)
                            .slideY(begin: 0.2, end: 0),
                        15.h.height,
                        AppCustomField(
                              labelTitle: 'Email Address',
                              hintText: 'Enter your email address',
                              prefixIcon: SvgPicture.asset(
                                AppAssets.emailFieldIcon,
                              ).paddingFromAll(10.sp),
                            )
                            .animate(delay: 800.ms)
                            .fadeIn(duration: 400.ms)
                            .slideY(begin: 0.2, end: 0),
                      ],
                    ),
                  ),

                  // ===== Profile Image + Camera =====
                  Positioned(
                    top: -50.h,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CustomCachedImage(
                            height: 100.sp,
                            width: 100.sp,
                            borderRadius: 80.sp,
                            isProfile: true,
                            imageUrl:
                                "https://randomuser.me/api/portraits/men/32.jpg",
                          ),
                          Positioned(
                            bottom: -12.h,
                            right: 0,
                            left: 0,
                            child: Center(
                              child: SvgPicture.asset(AppAssets.cameraIcon),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              30.h.height,
            ],
          ),
        ),
      ),

      // ===== Fixed Save Button =====
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.w),
        child: AppCustomButton(
          title: "Save",
          bgColor: AppColors.primary,
          onPressed: () {
            Get.back();
          },
        ),
      ).paddingBottom(48.h),
    );
  }
}
