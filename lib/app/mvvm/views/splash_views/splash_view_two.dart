import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../config/app_assets.dart';
import '../../../config/app_routes.dart';

class SplashViewTwo extends StatefulWidget {
  const SplashViewTwo({super.key});

  @override
  State<SplashViewTwo> createState() => _SplashViewTwoState();
}

class _SplashViewTwoState extends State<SplashViewTwo> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4), () {
      Get.offNamed(AppRoutes.getStartedView);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // 🌟 Main Logo Animation
          Center(
            child: Image.asset(AppAssets.appNameIcon, height: 300.h)
                .animate()
                .fadeIn(duration: 1000.ms, curve: Curves.easeInOut)
                .scale(begin: const Offset(0.6, 0.6), end: const Offset(1.0, 1.0), duration: 900.ms, curve: Curves.easeOutBack)
                .then(delay: 400.ms)
                .shake(duration: 800.ms, hz: 2, curve: Curves.easeInOut),
          ),


        ],
      ),
    );
  }
}
