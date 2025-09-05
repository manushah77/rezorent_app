import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/custom_widgets/custom_app_bar.dart';
import 'package:rezorent_app/app/custom_widgets/custom_auto_scroll_widget.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';
import '../../../custom_widgets/custom_cache_image/custom_cached_image.dart';

class CarRentalDetailsView extends StatefulWidget {
  const CarRentalDetailsView({super.key});

  @override
  State<CarRentalDetailsView> createState() => _CarRentalDetailsViewState();
}

class _CarRentalDetailsViewState extends State<CarRentalDetailsView> {
  PageController pageController = PageController();

  List<String> carImages = [
    "https://cdn.cars24.com/prod/new-car-cms/Maruti-Suzuki/New-Dzire/2024/11/12/f2f7185b-e5a2-45a4-ba32-2b9a066feeee-Car-dynamic-shot-680x601-_1_.jpg",
    "https://cdn.cars24.com/prod/new-car-cms/Maruti-Suzuki/New-Dzire/2024/11/12/f2f7185b-e5a2-45a4-ba32-2b9a066feeee-Car-dynamic-shot-680x601-_1_.jpg",
    "https://cdn.cars24.com/prod/new-car-cms/Maruti-Suzuki/New-Dzire/2024/11/12/f2f7185b-e5a2-45a4-ba32-2b9a066feeee-Car-dynamic-shot-680x601-_1_.jpg",
    "https://cdn.cars24.com/prod/new-car-cms/Maruti-Suzuki/New-Dzire/2024/11/12/f2f7185b-e5a2-45a4-ba32-2b9a066feeee-Car-dynamic-shot-680x601-_1_.jpg",
    "https://cdn.cars24.com/prod/new-car-cms/Maruti-Suzuki/New-Dzire/2024/11/12/f2f7185b-e5a2-45a4-ba32-2b9a066feeee-Car-dynamic-shot-680x601-_1_.jpg",
    "https://cdn.cars24.com/prod/new-car-cms/Maruti-Suzuki/New-Dzire/2024/11/12/f2f7185b-e5a2-45a4-ba32-2b9a066feeee-Car-dynamic-shot-680x601-_1_.jpg",
    "https://cdn.cars24.com/prod/new-car-cms/Maruti-Suzuki/New-Dzire/2024/11/12/f2f7185b-e5a2-45a4-ba32-2b9a066feeee-Car-dynamic-shot-680x601-_1_.jpg",
    "https://cdn.cars24.com/prod/new-car-cms/Maruti-Suzuki/New-Dzire/2024/11/12/f2f7185b-e5a2-45a4-ba32-2b9a066feeee-Car-dynamic-shot-680x601-_1_.jpg",
    "https://cdn.cars24.com/prod/new-car-cms/Maruti-Suzuki/New-Dzire/2024/11/12/f2f7185b-e5a2-45a4-ba32-2b9a066feeee-Car-dynamic-shot-680x601-_1_.jpg",
    "https://cdn.cars24.com/prod/new-car-cms/Maruti-Suzuki/New-Dzire/2024/11/12/f2f7185b-e5a2-45a4-ba32-2b9a066feeee-Car-dynamic-shot-680x601-_1_.jpg",
    "https://cdn.cars24.com/prod/new-car-cms/Maruti-Suzuki/New-Dzire/2024/11/12/f2f7185b-e5a2-45a4-ba32-2b9a066feeee-Car-dynamic-shot-680x601-_1_.jpg",
  ];

   String carName = 'Suzuki DZIRE';
   String location = 'street 2, Tirane, 1001 Tirana, Albania';
   String pricePerNight = '\$12/per night';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // pageController.addListener((){
    //   print(pageController.page);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: CustomAppBar(title: "Car Details", isWhite: false),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Hyundai I30",
                      style: AppTextStyles.customText(color: AppColors.darkTextColor, fontWeight: FontWeight.w700, fontSize: 20.sp),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(AppAssets.locationIcon, color: AppColors.darkTextColor, height: 20.sp, width: 20.sp),
                        9.w.width,
                        Text(
                          "Lagjia Partizani, Rruga Sheza.",
                          style: AppTextStyles.customText(color: AppColors.darkTextColor, fontWeight: FontWeight.w500, fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              10.w.width,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.sp),
                  border: Border.all(color: AppColors.borderColor),
                ),
                child: CustomCachedImage(
                  height: 52.sp,
                  width: 58.sp,
                  imageUrl: "https://marketplace.canva.com/EAFyLnK08nw/1/0/1600w/canva-beige-black-simple-modern-car-rental-logo-yPiPBx-aXso.jpg",
                  borderRadius: 8,
                ),
              ),
            ],
          ),
          10.h.height,
          CarCarouselWidget(carImages: carImages, carName: carName, location: location, pricePerNight: pricePerNight),
          10.h.height,
          Container(
            width: 1.sw,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.sp),
            ),
            padding: EdgeInsets.all(14.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price details",
                  style: AppTextStyles.customText16(color: AppColors.darkTextColor, fontWeight: FontWeight.w700),
                ),
                2.h.height,
                Divider(color: AppColors.borderColor,),
                10.h.height,
                _buildDetailRow("Price", "\$30.00 x 6 Day"),
                10.h.height,
                _buildDetailRow("Insurance", "\$800"),
                10.h.height,

              ],
            ) ,
          )
        ],
      ).paddingVertical(10.h).paddingHorizontal(16.w),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.customText16(color: AppColors.darkTextColor, fontWeight: FontWeight.w600),
        ),
        Text(
          value,
          style: AppTextStyles.customText16(color: AppColors.darkTextColor.withOpacity(0.7), fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
