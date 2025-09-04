import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';
import '../../config/app_assets.dart';
import '../../config/app_colors.dart';
import '../../config/app_routes.dart';
import '../../config/app_text_style.dart';
import '../app_custom_button.dart';

class LogoutSheet extends StatefulWidget {
  const LogoutSheet({super.key});

  @override
  State<LogoutSheet> createState() => _LogoutSheetState();
}

class _LogoutSheetState extends State<LogoutSheet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          15.h.height,
          SvgPicture.asset(AppAssets.homeIndicatorIcon),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset(AppAssets.closeIcon),
              ),
            ],
          ),
          5.h.height,
          Align(
            alignment: Alignment.center,
            child: Text(
              'Are you sure you want\nto logout from this account?',
              textAlign: TextAlign.center,
              style: AppTextStyles.customText18(color: AppColors.textColorDark, fontWeight: FontWeight.w600),
            ),
          ),
          24.h.height,

          AppCustomButton(
            title: 'Logout',
            onPressed: () {
              Get.offAllNamed(AppRoutes.loginView);
            },
          ),
          15.h.height,
        ],
      ).paddingHorizontal(20.w),
    );
  }
}
