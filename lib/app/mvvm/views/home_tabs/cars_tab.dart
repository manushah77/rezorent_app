import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:get/get.dart';
import 'package:rezorent_app/app/config/app_routes.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/custom_widgets/app_custom_button.dart';
import 'package:rezorent_app/app/custom_widgets/custom_cache_image/custom_cached_image.dart';
import 'package:rezorent_app/app/custom_widgets/custom_cards/reserve_rental_card.dart';
import 'package:rezorent_app/app/custom_widgets/custom_sheets/car_filter_sheet.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';
import '../../../config/utils.dart';
import '../../../custom_widgets/app_custom_field.dart';
import '../../../custom_widgets/custom_pickers/date_picker_dialog.dart';
import '../../view_model/home_controller/home_controller.dart';

class CarsTab extends StatefulWidget {
  const CarsTab({super.key});

  @override
  State<CarsTab> createState() => _CarsTabState();
}

class _CarsTabState extends State<CarsTab> {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
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
              onTap: () => Utils.showBottomSheet(context: context, child: CarFilterSheet()),

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
        15.h.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Our Vehicles Listing',
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
        15.h.height,
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: 120.h),
            itemCount: 6,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ReserveRentalCard(
                isForHotel: false,
                title: "Hyundai I30",
                location: "Lagjia Partizani, Rruga Sheza.",
                imageUrl: "https://cdn.cars24.com/prod/new-car-cms/Maruti-Suzuki/New-Dzire/2024/11/12/f2f7185b-e5a2-45a4-ba32-2b9a066feeee-Car-dynamic-shot-680x601-_1_.jpg",
                logoUrl: "https://marketplace.canva.com/EAFyLnK08nw/1/0/1600w/canva-beige-black-simple-modern-car-rental-logo-yPiPBx-aXso.jpg",
                buttonText: "Reserve Now",
                onPressed: () {
                  Get.toNamed(AppRoutes.carRentalDetailsView);
                },

                onReserveNow: () {
                  // Handle reserve logic
                },
              );
            },
          ),
        ),
      ],
    ).paddingHorizontal(15.w);
  }
}
