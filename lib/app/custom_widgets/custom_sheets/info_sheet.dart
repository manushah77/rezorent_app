import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rezorent_app/app/config/app_strings.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';
import '../../config/app_assets.dart';
import '../../config/app_colors.dart';
import '../../config/app_routes.dart';
import '../../config/app_text_style.dart';
import '../app_custom_button.dart';

class InfoSheet extends StatefulWidget {
  const InfoSheet({super.key});

  @override
  State<InfoSheet> createState() => _InfoSheetState();
}

class _InfoSheetState extends State<InfoSheet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          15.h.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Info",
                style: AppTextStyles.customText18(
                  color: AppColors.textColorDark,
                  fontWeight: FontWeight.bold,
                ),
              ).paddingTop(10.h),
              GestureDetector(
                onTap: () {
                  Get.back(); // closes dialog or screen
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.black, 
                  size: 24,
                ),
              ),

            ],
          ),
          5.h.height,
          Text(
            AppStrings.infoText,
            textAlign: TextAlign.start,
            style: AppTextStyles.customText14(
              color: Color(0xFF1E1E1E).withOpacity(0.8),
              fontWeight: FontWeight.w400,
            ),
          ),

          15.h.height,
        ],
      ).paddingHorizontal(20.w),
    );
  }
}
