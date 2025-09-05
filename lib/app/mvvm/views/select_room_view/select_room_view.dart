import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/custom_widgets/custom_app_bar.dart';

import '../../../config/app_routes.dart';
import '../../../custom_widgets/custom_cards/reserve_rental_card.dart';

class SelectRoomView extends StatefulWidget {
  const SelectRoomView({super.key});

  @override
  State<SelectRoomView> createState() => _SelectRoomViewState();
}

class _SelectRoomViewState extends State<SelectRoomView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Select Room', backgroundColor: Colors.transparent),
      body: ListView.builder(
        itemCount: 6,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ReserveRentalCard(
            isForHotel: true,
            title: "Hyundai I30",
            location: "Lagjia Partizani, Rruga Sheza.",
            imageUrl: "https://images.pexels.com/photos/164595/pexels-photo-164595.jpeg",
            logoUrl: "https://marketplace.canva.com/EAFyLnK08nw/1/0/1600w/canva-beige-black-simple-modern-car-rental-logo-yPiPBx-aXso.jpg",
            buttonText: "Reserve Now",
            onPressed: () {
              Get.toNamed(AppRoutes.roomDetailsView);
            },
            onReserveNow: () {},
          );
        },
      ).paddingHorizontal(15.w).paddingVertical(10.h),
    );
  }
}
