import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rezorent_app/app/config/app_colors.dart';
import 'package:rezorent_app/app/config/app_text_style.dart';
import 'package:rezorent_app/app/custom_widgets/app_custom_button.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';

import '../../config/app_assets.dart';

class PaymentCanceledDialog extends StatelessWidget {
  final VoidCallback onRetry;

  const PaymentCanceledDialog({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 0.5.sw,
              height: 0.25.sh,
              child: Image.asset(
                AppAssets.icPaymentCanceled,
                fit: BoxFit.contain,
              ),
            ),
            10.h.height,

            Text(
              "Oops! Your payment could\nnot be processed.",
              textAlign: TextAlign.center,
              style: AppTextStyles.customText20(
                fontWeight: FontWeight.bold,
                color: Color(0xFF515151).withOpacity(0.9),
              ),
            ),
            12.h.height,

            Text(
              "Your card was declined. Please verify your\npayment details or try a different method.",
              textAlign: TextAlign.center,
              style: AppTextStyles.customText14(
                color: Color(0xFF515151).withOpacity(0.9),
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
            ),
            24.h.height,

            SizedBox(
              width: double.infinity,
              child: AppCustomButton(
                title: "Try Again",
                bgColor: AppColors.primary,
                onPressed: onRetry,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
