import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:get/get.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';

import '../config/app_assets.dart';
import '../config/app_colors.dart';
import '../config/app_text_style.dart';

class CustomSwipeButton extends StatelessWidget {
  final String title;
  final VoidCallback onConfirm;

  const CustomSwipeButton({super.key, required this.title, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60.h,
      child: SwipeButton(
        thumb: Container(
          margin: EdgeInsets.all(5.sp),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r), color: AppColors.primary),
          child: Container(
            height: 45.h,
            width: 45.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r), color: AppColors.primary),
            child: Center(child: SvgPicture.asset(AppAssets.startedIcon)),
          ),
        ),
        onSwipeEnd: onConfirm,
        activeThumbColor: AppColors.white,
        activeTrackColor: AppColors.white,
        inactiveTrackColor: AppColors.white,
        height: 60.h,
        width: 1.sw,
        thumbPadding: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(16.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            24.w.width,
            Text(
              title,
              style: AppTextStyles.customText16(color: AppColors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
