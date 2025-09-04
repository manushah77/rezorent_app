import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rezorent_app/app/custom_widgets/custom_app_bar.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_strings.dart';
import '../../../config/app_text_style.dart';

class PrivacyPolicyView extends StatefulWidget {
  const PrivacyPolicyView({super.key});

  @override
  State<PrivacyPolicyView> createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldBgColor,
        appBar: CustomAppBar(
          toolBarHeight: 80.h,
          title: "Privacy Policy",
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(16.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      4.h.height,
                      Text(
                        "Lorem ipsum",
                        style: AppTextStyles.customText16(
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                      6.h.height,
                      Text(
                        AppStrings.loremIpsumText,
                        style: AppTextStyles.customText14(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                      20.h.height,

                      Text(
                        "Lorem ipsum",
                        style: AppTextStyles.customText16(
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                      6.h.height,
                      Text(
                        AppStrings.loremIpsumText,
                        style: AppTextStyles.customText14(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ]
                )
            )
        )
    );
  }
}
