import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rezorent_app/app/config/app_colors.dart';
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
        ],
      ),
    );
  }
}
