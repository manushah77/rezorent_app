import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rezorent_app/app/config/app_assets.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_routes.dart';
import '../../../config/app_strings.dart';
import '../../../config/app_text_style.dart';

class SplashViewOne extends StatefulWidget {
  const SplashViewOne({super.key});

  @override
  State<SplashViewOne> createState() => _SplashViewOneState();
}

class _SplashViewOneState extends State<SplashViewOne> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      Get.offNamed(AppRoutes.splashTwoView);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1️⃣ Logo animation
            Image.asset(AppAssets.splashLogo, height: 62.h, width: 62.w)
                .animate()
                .fadeIn(duration: 1000.ms, curve: Curves.easeInOut)
                .scale(
                  begin: const Offset(0.6, 0.6),
                  end: const Offset(1.0, 1.0),
                  duration: 900.ms,
                  curve: Curves.easeOutBack,
                )
                .then(delay: 400.ms)
                .shake(duration: 800.ms, hz: 2, curve: Curves.easeInOut),
            // 2️⃣ App name animation (after logo)
            Text(
                  "RezoRent",
                  style: AppTextStyles.customText32(
                    color: AppColors.textColorDark,
                    fontWeight: FontWeight.w700,
                  ),
                )
                .animate(delay: 900.ms)
                .fadeIn(duration: 800.ms)
                .slide(
                  begin: const Offset(0, 0.3),
                  end: Offset.zero,
                  curve: Curves.easeOut,
                ),

            // 3️⃣ Tagline animation (after name)
            Text(
                  AppStrings.tagLineText,
                  style: AppTextStyles.customText14(
                    color: const Color(0xB2000000),
                    fontWeight: FontWeight.w500,
                  ),
                )
                .animate(delay: 1600.ms) // after name
                .fadeIn(duration: 1000.ms)
                .slide(
                  begin: const Offset(0, 0.4),
                  end: Offset.zero,
                  curve: Curves.easeOut,
                ),
          ],
        ),
      ),
    );
  }
}
