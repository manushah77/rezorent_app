import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rezorent_app/app/config/app_colors.dart';
import 'package:rezorent_app/app/config/app_text_style.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/custom_widgets/app_custom_button.dart';
import 'package:rezorent_app/app/custom_widgets/custom_app_bar.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';

import '../../../config/app_assets.dart';
import '../../../custom_widgets/app_custom_field.dart';

class ForgotPassView extends StatefulWidget {
  const ForgotPassView({super.key});

  @override
  State<ForgotPassView> createState() => _ForgotPassViewState();
}

class _ForgotPassViewState extends State<ForgotPassView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F3F7),
      appBar: CustomAppBar(title: "Forgot Password", isWhite: true, toolBarHeight: 80.h, backgroundColor: Colors.transparent),
      body: Column(
        children: [
          30.h.height, // space before container
          Expanded(
            child: Container(
              width: double.infinity, // make it expand full width
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.sp), topRight: Radius.circular(20.sp)),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: AppTextStyles.customText28(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    2.h.height,
                    Text(
                      'Enter your registered Email address for\nverification.',
                      style: AppTextStyles.customText14(color: const Color(0xff979797), height: 1.2),
                    ),
                    30.h.height,
                    AppCustomField(
                      labelTitle: 'Email Address',
                      hintText: 'Enter Email',
                      prefixIcon: SvgPicture.asset(AppAssets.emailFieldIcon).paddingFromAll(10.sp),
                    ),
                    50.h.height,
                    AppCustomButton(title: 'Send', onPressed: () {}).paddingHorizontal(30.w),
                  ],
                ).paddingFromAll(14.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
