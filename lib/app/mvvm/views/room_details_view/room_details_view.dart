import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rezorent_app/app/config/app_routes.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/custom_widgets/custom_app_bar.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';
import '../../../custom_widgets/app_custom_button.dart';
import '../../../custom_widgets/custom_auto_scroll_widget.dart';

class RoomDetailsView extends StatefulWidget {
  const RoomDetailsView({super.key});

  @override
  State<RoomDetailsView> createState() => _RoomDetailsViewState();
}

class _RoomDetailsViewState extends State<RoomDetailsView> {
  List<String> hotelImages = [
    "https://images.unsplash.com/photo-1505691938895-1758d7feb511", // modern hotel lobby
    "https://images.unsplash.com/photo-1505691938895-1758d7feb511", // elegant hotel room
    "https://images.unsplash.com/photo-1522708323590-d24dbb6b0267", // tropical villa
    "https://images.unsplash.com/photo-1505691938895-1758d7feb511", // hotel exterior
    "https://images.unsplash.com/photo-1522708323590-d24dbb6b0267", // seaside hotel
  ];
  String carName = 'Hotel Theatro';
  String location = 'street 2, Tirane, 1001 Tirana, Albania';
  String pricePerNight = '\$120/per night';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Room Details', backgroundColor: Colors.transparent),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              15.h.height,
              CarCarouselWidget(carImages: hotelImages, carName: carName, location: location, pricePerNight: pricePerNight, borderRadius: 0),
              15.h.height,
              Container(
                decoration: BoxDecoration(color: AppColors.scaffoldBgColor, borderRadius: BorderRadius.circular(12.sp)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Room Type', style: AppTextStyles.customText14(color: AppColors.textLightBlack)),
                              Text(
                                'Single',
                                style: AppTextStyles.customText16(color: Colors.black, fontWeight: FontWeight.w600),
                              ),
                              9.h.height,
                              Text('Bathroom', style: AppTextStyles.customText14(color: AppColors.textLightBlack)),
                              Text(
                                'Private',
                                style: AppTextStyles.customText16(color: Colors.black, fontWeight: FontWeight.w600),
                              ),
                              9.h.height,
                              Text('Smoking Allowed?', style: AppTextStyles.customText14(color: AppColors.textLightBlack)),
                              Text(
                                'Yes',
                                style: AppTextStyles.customText16(color: Colors.black, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Bed Type', style: AppTextStyles.customText14(color: AppColors.textLightBlack)),
                              Text(
                                'King Size Bed',
                                style: AppTextStyles.customText16(color: Colors.black, fontWeight: FontWeight.w600),
                              ),
                              9.h.height,
                              Text('Person can Stay', style: AppTextStyles.customText14(color: AppColors.textLightBlack)),
                              Text(
                                '1 Adult',
                                style: AppTextStyles.customText16(color: Colors.black, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ).paddingFromAll(10.sp),
              ).paddingHorizontal(16.w),
              30.h.height,
              AppCustomButton(title: "Reserve Now", onPressed: () {
                Get.toNamed(AppRoutes.paymentView);
              }).paddingHorizontal(30.w),
            ],
          ),
        ).paddingHorizontal(4.w),
      ),
    );
  }
}
