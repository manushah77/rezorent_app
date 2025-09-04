import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_routes.dart';
import '../../../config/app_strings.dart';
import '../../../config/app_text_style.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      Get.offNamed(AppRoutes.getStartedView);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🌟 Main Logo Animation
            Image.asset(AppAssets.splashLogo, height: 60.h, width: 185.w)
                .animate()
                .fadeIn(duration: 1000.ms, curve: Curves.easeInOut)
                .scale(begin: const Offset(0.6, 0.6), end: const Offset(1.0, 1.0), duration: 900.ms, curve: Curves.easeOutBack)
                .then(delay: 400.ms)
                .shake(duration: 800.ms, hz: 2, curve: Curves.easeInOut),
            // 🌟 Tagline Animation
            Text(
                  AppStrings.tagLineText,
                  style: AppTextStyles.customText14(color: const Color(0xB2FFFFFF), fontWeight: FontWeight.w500, letterSpacing: 7),
                )
                .animate(delay: 1600.ms) // after logo animation
                .fadeIn(duration: 1000.ms)
                .slide(begin: const Offset(0, 0.4), end: Offset.zero, curve: Curves.easeOut),
          ],
        ),
      ),
    );
  }
}
