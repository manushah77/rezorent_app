import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';
import '../../../custom_widgets/custom_app_bar.dart';
import '../../../custom_widgets/custom_tiles/booking_detail_tile.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  final bookingsData = [
    {
      "status": "active",
      "isCarBooking": true,
      "title": "Forest Cabin",
      "image": "https://plus.unsplash.com/premium_photo-1687960116497-0dc41e1808a2?q=80&w=1171&auto=format&fit=crop",
      "location": "Lagjia Partizani, Rruga Shezai Como, 6001 ...",
      "price": "250",
      "subtitle": "Per night before taxes and fees",
    },
    {
      "status": "active",
      "isCarBooking": false,
      "title": "Beachfront Villa",
      "image": "https://images.unsplash.com/photo-1600585154340-be6161a56a0c?q=80&w=1170&auto=format&fit=crop",
      "location": "Malibu, California, USA",
      "price": "480",
      "subtitle": "Per night including breakfast",
    },
    {
      "status": "active",
      "isCarBooking": true,
      "title": "Luxury Car Rental",
      "image": "https://images.unsplash.com/photo-1549921296-3a32b19b8b7b?q=80&w=1170&auto=format&fit=crop",
      "location": "Downtown, Los Angeles, USA",
      "price": "120",
      "subtitle": "Per day with unlimited mileage",
    },
    {
      "status": "active",
      "isCarBooking": false,
      "title": "Mountain Resort",
      "image": "https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?q=80&w=1170&auto=format&fit=crop",
      "location": "Aspen Highlands, Colorado, USA",
      "price": "320",
      "subtitle": "Per night with complimentary spa access",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      appBar: CustomAppBar(
        toolBarHeight: 80.h,
        titleWidget: Text(
          'Booking History',
          style: AppTextStyles.customText28(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: SizedBox.shrink(),
        backgroundColor: Colors.white,
        leadingWidth: 10.w,
      ),
      body: ListView.builder(
        itemCount: bookingsData.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final booking = bookingsData[index];
          return BookingDetailTile(
            status: booking["status"] as String,
            isCarBooking: booking["isCarBooking"] as bool,
            title: booking["title"] as String,
            image: booking["image"] as String,
            location: booking["location"] as String,
            price: booking["price"] as String,
            subtitle: booking["subtitle"] as String,
          );
        },
      ).paddingHorizontal(15.w).paddingTop(15.h),
    );
  }
}
