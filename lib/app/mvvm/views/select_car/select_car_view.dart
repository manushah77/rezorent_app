import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rezorent_app/app/config/app_colors.dart';
import 'package:rezorent_app/app/config/app_text_style.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/custom_widgets/custom_app_bar.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';

import '../../../custom_widgets/custom_cards/reserve_rental_card.dart';

class SelectCarView extends StatefulWidget {
  const SelectCarView({super.key});

  @override
  State<SelectCarView> createState() => _SelectCarViewState();
}

class _SelectCarViewState extends State<SelectCarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: CustomAppBar(title: "Select Car", centerTitle: true),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Other Vehicles by This Company",
                  style: AppTextStyles.customText(fontSize: 18.sp, fontWeight: FontWeight.w700),
                ),
              ],
            ).paddingHorizontal(17.w),
            10.h.height,
            Expanded(child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: 4,
                itemBuilder: (context, index){
              return ReserveRentalCard(
                isForHotel: false,
                title: "Hyundai I30",
                location: "Lagjia Partizani, Rruga Sheza.",
                imageUrl: "https://cdn.cars24.com/prod/new-car-cms/Maruti-Suzuki/New-Dzire/2024/11/12/f2f7185b-e5a2-45a4-ba32-2b9a066feeee-Car-dynamic-shot-680x601-_1_.jpg",
                logoUrl: "https://marketplace.canva.com/EAFyLnK08nw/1/0/1600w/canva-beige-black-simple-modern-car-rental-logo-yPiPBx-aXso.jpg",
                buttonText: "Reserve Now",
                isForOtherCars: true,
                price: "\$30 /day",
                onPressed: () {
                  // Get.toNamed(AppRoutes.carRentalDetailsView);
                },

                onReserveNow: () {
                  // Handle reserve logic
                },
              );
            }))
          ],
        ),
      ),
    );
  }
}
