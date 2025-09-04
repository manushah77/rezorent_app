import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';
import '../../../custom_widgets/app_custom_button.dart';
import '../../../custom_widgets/app_custom_field.dart';
import '../../../custom_widgets/custom_app_bar.dart';
import '../../view_model/auth_controllers/delete_account_controller.dart';

class DeleteAccountView extends StatefulWidget {
  const DeleteAccountView({super.key});

  @override
  State<DeleteAccountView> createState() => _DeleteAccountViewState();
}

class _DeleteAccountViewState extends State<DeleteAccountView> {
  final DeleteAccountController controller = Get.put(DeleteAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      appBar: CustomAppBar(
        title: "Delete Account",
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              40.h.height,
              Image.asset(AppAssets.deleteAccountIcon,height: 88.h,width: 88.w,),
              10.h.height,
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Your account will be permanently deleted. You\nno longer can access it.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.customText14(
                    color: AppColors.textColorDark.withOpacity(0.6),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              24.h.height,
              Obx(
                () =>
                    AppCustomField(
                          labelTitle: "Password",
                          hintText: "Enter Password Here",
                          fillColor: AppColors.white,
                          prefixIcon: SvgPicture.asset(
                            AppAssets.passwordFieldIcon,
                          ).paddingFromAll(10.sp),
                          obscureText: controller.isVisible.value,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              controller.isVisible.value =
                                  !controller.isVisible.value;
                            },
                            child: Image.asset(
                              controller.isVisible.value
                                  ? AppAssets.visibilityOff
                                  : AppAssets.visibilityOn,
                              height: 15.h,
                            ).paddingFromAll(12.sp),
                          ),
                        )
                        .animate(delay: 600.ms)
                        .fadeIn(duration: 400.ms)
                        .slideY(begin: 0.2, end: 0),
              ),
              40.h.height,

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppCustomButton(
                  title: "Delete Account",
                  bgColor: AppColors.negativeRed,
                  onPressed: () {
                    Get.back();
                  },
                ),
              ).paddingHorizontal(20.w),
            ],
          ),
        ),
      ),
    );
  }
}
