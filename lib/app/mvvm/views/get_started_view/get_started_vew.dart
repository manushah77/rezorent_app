import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_routes.dart';
import '../../../config/app_text_style.dart';
import '../../../custom_widgets/custom_swipe_button.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({super.key});

  @override
  State<GetStartedView> createState() => _GetStartedViewState();
}

class _GetStartedViewState extends State<GetStartedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 📸 Fullscreen Background
          Container(
            height: ScreenUtil().screenHeight,
            width: ScreenUtil().screenWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.bgGetStarted),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 📝 Foreground Content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  // 🔹 Title
                  Row(
                        children: [
                          Text(
                            'Discover,',
                            style: AppTextStyles.customText36(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              height: 1,
                            ),
                          ),
                          Text(
                            ' Book,',
                            style: AppTextStyles.customText36(
                              // fixed: keep same size
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                              height: 1,
                            ),
                          ),
                        ],
                      )
                      .animate()
                      .fadeIn(duration: 1000.ms, delay: 500.ms)
                      .slide(
                        begin: const Offset(0, 0.3),
                        curve: Curves.easeOut,
                      ),

                  Text(
                        'Share',
                        style: AppTextStyles.customText36(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                          height: 1,
                        ),
                      )
                      .animate()
                      .fadeIn(duration: 1000.ms, delay: 700.ms)
                      .slide(
                        begin: const Offset(0, 0.3),
                        curve: Curves.easeOut,
                      ),

                  12.h.height,

                  // 🔹 Subtitle
                  Text(
                        "Explore new destinations, book with ease, share your journey—and earn rewards along the way.",
                        style: AppTextStyles.customText16(
                          color: AppColors.textSecondary,
                          height: 1.4,
                        ),
                      )
                      .animate()
                      .fadeIn(duration: 1200.ms, delay: 1100.ms)
                      .slide(
                        begin: const Offset(0, 0.2),
                        curve: Curves.easeOut,
                      ),

                  20.h.height,

                  CustomSwipeButton(
                        onConfirm: () {
                          // navigate when swiped
                        },
                        title: 'Get Started',
                      )
                      .paddingHorizontal(20.w)
                      .animate()
                      .fadeIn(duration: 1000.ms, delay: 1300.ms)
                      .slide(
                        begin: const Offset(0, 0.5),
                        curve: Curves.easeOutBack,
                      )
                      .then()
                      .scale(
                        duration: 1500.ms,
                        begin: const Offset(1, 1),
                        end: const Offset(1.05, 1.05),
                        curve: Curves.easeInOut,
                      )
                      .then()
                      .scale(
                        duration: 1500.ms,
                        begin: const Offset(1.05, 1.05),
                        end: const Offset(1, 1),
                        curve: Curves.easeInOut,
                      ),

                  20.h.height,

                  Center(
                    child: TextButton(
                      onPressed: () {
                        // Navigate as guest
                      },
                      child: Text(
                        "Continue As Guest",
                        style: AppTextStyles.customText20(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  10.h.height,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
