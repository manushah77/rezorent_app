import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rezorent_app/app/config/app_assets.dart';
import 'package:rezorent_app/app/config/app_colors.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/config/utils.dart';
import 'package:rezorent_app/app/custom_widgets/app_custom_field.dart';
import 'package:rezorent_app/app/custom_widgets/custom_pickers/date_picker_dialog.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';
import 'package:rezorent_app/app/mvvm/view_model/home_controller/home_controller.dart';

class HotelsTab extends StatefulWidget {
  const HotelsTab({super.key});

  @override
  State<HotelsTab> createState() => _HotelsTabState();
}

class _HotelsTabState extends State<HotelsTab> {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: AppCustomField(
                  titleWidget: SizedBox.shrink(),
                  enabledBorder: 50.sp,
                  disabledBorder: 50.sp,
                  enabledBorderColor: Color(0xffD9D9D9),
                  focusedBorder: 50.sp,
                  focusedBorderColor: AppColors.primary,
                  textInputAction: TextInputAction.search,
                  prefixIcon: SvgPicture.asset(AppAssets.searchIcon).paddingFromAll(10.sp),
                  hintText: 'Search Here...',
                  fillColor: Colors.transparent,
                ),
              ),
              7.w.width,
              Container(
                height: 50.sp,
                width: 50.sp,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xffD9D9D9)),
                  color: Colors.transparent,
                ),
                child: Center(child: SvgPicture.asset(AppAssets.filterIcon)),
              ),
            ],
          ),
          7.h.height,
          AppCustomField(
            titleWidget: SizedBox.shrink(),
            enabledBorder: 8.sp,
            disabledBorder: 8.sp,
            enabledBorderColor: Color(0xffD9D9D9),
            focusedBorder: 8.sp,
            focusedBorderColor: AppColors.primary,
            textInputAction: TextInputAction.search,
            prefixIcon: SvgPicture.asset(AppAssets.locationIcon, color: Colors.black).paddingFromAll(12.sp),
            hintText: 'Where to go?',
            hintColor: AppColors.black,
            hintTextFontSize: 16,
            fillColor: Colors.transparent,
          ),
          7.h.height,
          Row(
            children: [
              Expanded(
                child: AppCustomField(
                  titleWidget: SizedBox.shrink(),
                  enabledBorder: 8.sp,
                  disabledBorder: 8.sp,
                  controller: controller.fromDateController,
                  isReadOnly: true,
                  enabledBorderColor: Color(0xffD9D9D9),
                  focusedBorder: 8.sp,
                  focusedBorderColor: AppColors.primary,
                  textInputAction: TextInputAction.search,
                  prefixIcon: SvgPicture.asset(AppAssets.fromDateIcon, color: Colors.black).paddingFromAll(12.sp),
                  hintText: 'From',
                  hintColor: AppColors.black,
                  hintTextFontSize: 16,
                  fillColor: Colors.transparent,
                  onTap: () async {
                    controller.fromDateController.text = Utils.formatDateDMY(await ShowDatePicker(context));
                  },
                ),
              ),
              10.w.width,
              Expanded(
                child: AppCustomField(
                  titleWidget: SizedBox.shrink(),
                  enabledBorder: 8.sp,
                  disabledBorder: 8.sp,
                  controller: controller.toDateController,
                  isReadOnly: true,
                  onTap: () async {
                    controller.toDateController.text = Utils.formatDateDMY(await ShowDatePicker(context));
                  },
                  enabledBorderColor: Color(0xffD9D9D9),
                  focusedBorder: 8.sp,
                  focusedBorderColor: AppColors.primary,
                  textInputAction: TextInputAction.search,
                  prefixIcon: SvgPicture.asset(AppAssets.toDateIcon, color: Colors.black).paddingFromAll(12.sp),
                  hintText: 'To',
                  hintColor: AppColors.black,
                  hintTextFontSize: 16,
                  fillColor: Colors.transparent,
                ),
              ),
            ],
          ),
        ],
      ).paddingHorizontal(15.w),
    );
  }
}
