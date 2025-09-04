import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rezorent_app/app/config/app_colors.dart';
import 'package:rezorent_app/app/config/app_routes.dart';
import 'package:rezorent_app/app/config/app_text_style.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/custom_widgets/app_custom_button.dart';
import 'package:rezorent_app/app/custom_widgets/custom_app_bar.dart';
import 'package:rezorent_app/app/custom_widgets/custom_cache_image/custom_cached_image.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';

import '../../../config/app_assets.dart';
import '../../../config/utils.dart';
import '../../../custom_widgets/custom_sheets/logout_sheet.dart';

class ProfileSettingsView extends StatefulWidget {
  const ProfileSettingsView({super.key});

  @override
  State<ProfileSettingsView> createState() => _ProfileSettingsViewState();
}

class _ProfileSettingsViewState extends State<ProfileSettingsView> {
  bool notificationEnabled = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      appBar: CustomAppBar(
        title: "Profile Settings",
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              50.h.height,
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 20.h, bottom: 20.h, left: 16.w, right: 16.w),
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
                        40.h.height,
                        Text(
                          "Darrell Steward",
                          style: AppTextStyles.customText16(
                            fontWeight: FontWeight.w500,
                            color: AppColors.textColorDark,
                          ),
                        ),
                        4.h.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppAssets.messageIcon),
                            4.w.width,
                            Text(
                              "johnsonwilliams34@gmail.com",
                              style: AppTextStyles.customText14(
                                color: AppColors.textColorDark.withOpacity(0.5),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        16.h.height,
                        AppCustomButton(
                          title: "Edit Profile",
                          bgColor: AppColors.primary,
                          onPressed: () {
                            Get.toNamed(AppRoutes.editProfileView);
                          },
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: -50.h,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: CustomCachedImage(
                        height: 100.sp,
                        width: 100.sp,
                        borderRadius: 80.sp,
                        isProfile: true,
                        imageUrl: "https://randomuser.me/api/portraits/men/32.jpg",
                      ),
                    ),
                  ),
                ],
              ),
              20.h.height,
              Container(
                width: double.infinity,
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
                    _settingsTile(
                      leading: Image.asset(AppAssets.notificationIc, height: 43.h, width: 43.w),
                      title: "Push Notifications",
                      trailing: Container(
                        width: 40.w,
                        alignment: Alignment.centerRight,
                        child: Transform.scale(
                          scale: 0.7,
                          child: Switch(
                            value: notificationEnabled,
                            activeColor: AppColors.white,
                            activeTrackColor: AppColors.primary,
                            inactiveThumbColor: AppColors.primary,
                            inactiveTrackColor: Color(0xFFF3F3F7),
                            trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
                            onChanged: (val) {
                              setState(() {
                                notificationEnabled = val;
                              });
                            },
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                    Divider(height: 1, thickness: 1, color: AppColors.textLightBlack.withOpacity(0.1)).paddingHorizontal(14.w).paddingVertical(6.h),
                    _settingsTile(
                      leading: Image.asset(AppAssets.aboutUsIcon, height: 43.h, width: 43.w),
                      title: "About Us",
                      trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
                      onTap: () {
                        Get.toNamed(AppRoutes.aboutUsView);
                      },
                    ),
                    Divider(height: 1, thickness: 1, color: AppColors.textLightBlack.withOpacity(0.1)).paddingHorizontal(14.w).paddingVertical(6.h),
                    _settingsTile(
                      leading: Image.asset(AppAssets.privacyIcon, height: 43.h, width: 43.w),
                      title: "Privacy Policy",
                      trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
                      onTap: () {
                        Get.toNamed(AppRoutes.privacyPolicyView);
                      },
                    ),
                    Divider(height: 1, thickness: 1, color: AppColors.textLightBlack.withOpacity(0.1)).paddingHorizontal(14.w).paddingVertical(6.h),

                    _settingsTile(
                      leading: Image.asset(AppAssets.termsIcon, height: 43.h, width: 43.w),
                      title: "Terms & Conditions",
                      trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
                      onTap: () {
                       Get.toNamed(AppRoutes.termsAndConditionView);
                      },
                    ),
                    Divider(height: 1, thickness: 1, color: AppColors.textLightBlack.withOpacity(0.1)).paddingHorizontal(14.w).paddingVertical(6.h),

                    _settingsTile(
                      leading: Image.asset(AppAssets.signOutIcon, height: 43.h, width: 43.w),
                      title: "Sign out",
                      trailing: SizedBox.shrink(),
                      onTap: () {
                       Utils.showBottomSheet(context: context, child: LogoutSheet());
                      },
                    ),
                    Divider(height: 1, thickness: 1, color: AppColors.textLightBlack.withOpacity(0.1)).paddingHorizontal(14.w).paddingVertical(6.h),

                    _settingsTile(
                      leading: Image.asset(AppAssets.deleteIcon, height: 43.h, width: 43.w),
                      title: "Delete account",
                      titleColor: Colors.red,
                      trailing: const SizedBox(),
                      onTap: () {
                      Get.toNamed(AppRoutes.deleteAccountView);
                      },
                    ),
                  ],
                ),
              ),
              16.h.height
            ],
          ),
        ),
      ),
    );
  }

  Widget _settingsTile({
    required Widget leading,
    required String title,
    required Widget trailing,
    required VoidCallback onTap,
    Color titleColor = Colors.black,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      leading: leading,
      title: Text(
        title,
        style: AppTextStyles.customText14(
          color: titleColor,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
