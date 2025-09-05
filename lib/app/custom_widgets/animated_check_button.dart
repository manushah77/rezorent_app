import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rezorent_app/app/config/app_colors.dart';

import '../config/app_assets.dart';

class AnimatedCheckButton extends StatelessWidget {
  bool isChecked;

  final VoidCallback onTap;

  AnimatedCheckButton({super.key, required this.isChecked, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 20.sp,
        width: 20.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.sp),
          border: Border.all(color: AppColors.textDarkColor, width: 1.2),
        ),
        child: Center(
          child: AnimatedCrossFade(
            crossFadeState: isChecked ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            firstChild: SizedBox.shrink(),
            secondCurve: Curves.slowMiddle,
            firstCurve: Curves.slowMiddle,
            secondChild: Center(
              child: SvgPicture.asset(AppAssets.checkIcon, height: 11.sp, width: 11.sp),
            ),
            duration: Duration(milliseconds: 300),
          ),
        ),
      ),
    );
  }
}
