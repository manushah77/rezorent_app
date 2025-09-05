import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rezorent_app/app/config/app_colors.dart';
import 'package:rezorent_app/app/config/app_text_style.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/custom_widgets/animated_check_button.dart';
import 'package:rezorent_app/app/custom_widgets/app_custom_button.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';
import 'package:rezorent_app/app/mvvm/view_model/home_controller/home_controller.dart';

import '../../config/app_assets.dart';
import '../app_custom_field.dart';

class CarFilterSheet extends StatefulWidget {
  const CarFilterSheet({super.key});

  @override
  State<CarFilterSheet> createState() => _CarFilterSheetState();
}

class _CarFilterSheetState extends State<CarFilterSheet> {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().screenHeight * 0.8,
      child: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 40.sp,
                        width: 40.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.sp),
                          border: Border.all(color: Color(0xffD9D9D9)),
                          color: Colors.transparent,
                        ),
                        child: Center(child: SvgPicture.asset(AppAssets.filterIcon)),
                      ),
                      20.w.width,
                      Text(
                        'Filter',
                        style: AppTextStyles.customText18(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(Icons.close, size: 24.sp, color: Colors.black),
                  ),
                ],
              ),
              10.h.height,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Filter by:',
                  style: AppTextStyles.customText24(color: Colors.black, fontWeight: FontWeight.w600),
                ),
              ),
              10.h.height,
              Divider(color: Color(0xffD9D9D9)),
              10.h.height,
              AppCustomField(
                titleWidget: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Find Hotels Near You',
                    style: AppTextStyles.customText16(color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ),
                hintText: 'Using Your Current Location',
                prefixIcon: SvgPicture.asset(AppAssets.locationIcon).paddingFromAll(10.sp),
              ),
              8.h.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(() {
                    return _buildDistanceFilter(
                      value: 'walking',
                      title: 'Walking',
                      number: 3,
                      selectedValue: controller.filterDistanceValue.value,
                      onTap: () {
                        controller.filterDistanceValue.value = 'walking';
                      },
                    );
                  }),
                  5.w.width,
                  Obx(() {
                    return _buildDistanceFilter(
                      value: 'short',
                      title: 'Short Drive',
                      number: 8,
                      selectedValue: controller.filterDistanceValue.value,
                      onTap: () {
                        controller.filterDistanceValue.value = 'short';
                      },
                    );
                  }),
                  5.w.width,
                  Obx(() {
                    return _buildDistanceFilter(
                      value: 'nearby',
                      title: 'Nearby',
                      number: 8,
                      selectedValue: controller.filterDistanceValue.value,
                      onTap: () {
                        controller.filterDistanceValue.value = 'nearby';
                      },
                    );
                  }),
                ],
              ),
              10.h.height,
              Divider(color: Color(0xffD9D9D9)),
              8.h.height,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Transmission Modes',
                  style: AppTextStyles.customText18(color: Color(0xff111827), fontWeight: FontWeight.w600),
                ),
              ),
              10.h.height,
              ...controller.transmissionModes.map((val){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(() {
                      return AnimatedCheckButton(
                        isChecked: controller.selectedTransmissionModes.contains(val),
                        onTap: () {
                          if(controller.selectedTransmissionModes.contains(val)){
                            controller.selectedTransmissionModes.remove(val);
                          }else{
                            controller.selectedTransmissionModes.add(val);
                          }
                          // controller.singleBedValue.value = !controller.singleBedValue.value;
                        },
                      );
                    }),
                    10.w.width,
                    Text(val, style: AppTextStyles.customText16(color: AppColors.textDarkColor)),
                  ],
                ).paddingBottom(5.h);
              }),
              4.h.height,
              Divider(color: Color(0xffD9D9D9)),
              8.h.height,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Fuel Type',
                  style: AppTextStyles.customText18(color: Color(0xff111827), fontWeight: FontWeight.w600),
                ),
              ),
              10.h.height,
              ...controller.fuelModes.map((val){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(() {
                      return AnimatedCheckButton(
                        isChecked: controller.selectedFuelModes.contains(val),
                        onTap: () {
                          if(controller.selectedFuelModes.contains(val)){
                            controller.selectedFuelModes.remove(val);
                          }else{
                            controller.selectedFuelModes.add(val);
                          }
                          // controller.singleBedValue.value = !controller.singleBedValue.value;
                        },
                      );
                    }),
                    10.w.width,
                    Text(val, style: AppTextStyles.customText16(color: AppColors.textDarkColor)),
                  ],
                ).paddingBottom(5.h);
              }),
              15.h.height,
              AppCustomButton(
                title: "Apply",
                onPressed: () {
                  Get.back();
                },
              ).paddingHorizontal(15.w),
            ],
          ),
        ).paddingFromAll(12.sp).paddingHorizontal(5.w),
      ),
    );
  }

  _buildDistanceFilter({required String value, required String title, required int number, required String selectedValue, required VoidCallback onTap}) {
    bool isSelected = value == selectedValue;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xffEFF8FF) : Colors.transparent,
          borderRadius: BorderRadius.circular(50.sp),
          border: Border.all(color: isSelected ? AppColors.primary : Color(0xffB6B6B6)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: AppTextStyles.customText14(color: AppColors.textDarkColor)),
            3.w.width,
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: isSelected ? Colors.white : Color(0xffEFF8FF)),
              child: Text(number.toString(), style: AppTextStyles.customText10(color: AppColors.primary)).paddingFromAll(3.sp),
            ),
          ],
        ).paddingHorizontal(15.w).paddingVertical(7.h),
      ),
    );
  }
}
