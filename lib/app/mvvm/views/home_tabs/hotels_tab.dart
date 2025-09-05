import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rezorent_app/app/config/app_assets.dart';
import 'package:rezorent_app/app/config/app_colors.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/config/utils.dart';
import 'package:rezorent_app/app/custom_widgets/app_custom_button.dart';
import 'package:rezorent_app/app/custom_widgets/app_custom_field.dart';
import 'package:rezorent_app/app/custom_widgets/custom_pickers/date_picker_dialog.dart';
import 'package:rezorent_app/app/custom_widgets/custom_sheets/hotel_filter_sheet.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';
import 'package:rezorent_app/app/mvvm/view_model/home_controller/home_controller.dart';

import '../../../config/app_routes.dart';
import '../../../config/app_text_style.dart';
import '../../../custom_widgets/custom_cards/reserve_rental_card.dart';

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
              GestureDetector(
                onTap: () => Utils.showBottomSheet(context: context, child: HotelFilterSheet()),
                child: Container(
                  height: 50.sp,
                  width: 50.sp,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xffD9D9D9)),
                    color: Colors.transparent,
                  ),
                  child: Center(child: SvgPicture.asset(AppAssets.filterIcon)),
                ),
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
            textInputAction: TextInputAction.done,
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
          10.h.height,
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffD9D9D9)),
              borderRadius: BorderRadius.circular(8.sp),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppAssets.travelersIcon),
                    3.w.width,
                    Text(
                      'Travelers',
                      style: AppTextStyles.customText16(color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                10.h.height,
                _buildTravelersTile(value: controller.adultsCount, title: "Adult", subtitle: "12 years and above"),
                10.h.height,
                DottedLine(dashColor: AppColors.textLightBlack.withOpacity(0.6)),
                10.h.height,
                _buildTravelersTile(value: controller.childrenCount, title: "Children", subtitle: "2 - 11 years old"),
                10.h.height,
                DottedLine(dashColor: AppColors.textLightBlack.withOpacity(0.6)),
                10.h.height,
                _buildTravelersTile(
                  value: controller.infantCount,
                  title: "Infant",
                  subtitle: "Below 2 years old P500 fare / infant to be paid at the terminal",
                ),
              ],
            ).paddingFromAll(8.sp),
          ),
          15.h.height,
          AppCustomButton(title: "Search", onPressed: () {}).paddingHorizontal(15.w),
          15.h.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Our Hotels',
                style: AppTextStyles.customText24(color: Color(0xff0C1D24), fontWeight: FontWeight.w600),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'See All',
                    style: AppTextStyles.customText12(color: AppColors.textDarkColor, fontWeight: FontWeight.w500),
                  ),
                  4.w.width,
                  SvgPicture.asset(AppAssets.seeAllIcon),
                ],
              ),
            ],
          ),
          10.h.height,
          ListView.builder(
            padding: EdgeInsets.only(bottom: 120.h),
            itemCount: 6,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ReserveRentalCard(
                isForHotel: true,
                title: "Hyundai I30",
                location: "Lagjia Partizani, Rruga Sheza.",
                imageUrl: "https://cdn.cars24.com/prod/new-car-cms/Maruti-Suzuki/New-Dzire/2024/11/12/f2f7185b-e5a2-45a4-ba32-2b9a066feeee-Car-dynamic-shot-680x601-_1_.jpg",
                logoUrl: "https://marketplace.canva.com/EAFyLnK08nw/1/0/1600w/canva-beige-black-simple-modern-car-rental-logo-yPiPBx-aXso.jpg",
                buttonText: "Reserve Now",
                onPressed: () {
                  Get.toNamed(AppRoutes.hotelDetailsView);
                },
                onReserveNow: () {
                  // Handle reserve logic
                },
              );
            },
          ),
        ],
      ).paddingHorizontal(15.w),
    );
  }

  Widget _buildTravelersTile({required RxInt value, required String title, required String subtitle}) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.customText16(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 200.w,
                child: Text(subtitle, style: AppTextStyles.customText12(color: AppColors.textLightBlack)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  if (value > 0) {
                    value.value--;
                  }
                },
                child: SvgPicture.asset(AppAssets.decrementIcon),
              ),
              5.w.width,
              SizedBox(
                width: 20.w,
                child: Text(
                  value.toString(),
                  style: AppTextStyles.customText18(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              5.w.width,
              GestureDetector(
                onTap: () {
                  value.value++;
                },
                child: SvgPicture.asset(AppAssets.incrementIcon),
              ),
            ],
          ),
        ],
      );
    });
  }
}
