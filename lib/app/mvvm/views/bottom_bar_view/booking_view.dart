import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rezorent_app/app/config/app_colors.dart';
import 'package:rezorent_app/app/config/app_text_style.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/custom_widgets/custom_app_bar.dart';
import 'package:rezorent_app/app/custom_widgets/custom_tiles/booking_detail_tile.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';

class BookingView extends StatefulWidget {
  const BookingView({super.key});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> with TickerProviderStateMixin {
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

  TabController? tabController;
  List tabs = [Tab(text: "Pending"), Tab(text: "Active")];

  @override
  void initState() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      appBar: CustomAppBar(
        toolBarHeight: 80.h,
        titleWidget: Text(
          'Booking Details',
          style: AppTextStyles.customText28(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        leading: SizedBox.shrink(),
        backgroundColor: Colors.white,
        leadingWidth: 10.w,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50.h,
              decoration: BoxDecoration(color: AppColors.transparent, borderRadius: BorderRadius.circular(33.sp)),
              child: TabBar(
                controller: tabController,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                isScrollable: false,
                tabs: tabs.map((tab) {
                  int index = tabs.indexOf(tab);
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.transparent,
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(33.sp),
                    ),
                    child: Tab(text: tab.text).paddingSymmetric(horizontal: 10.w),
                  ).paddingHorizontal(5.w);
                }).toList(),
                indicatorColor: AppColors.primary,
                labelColor: AppColors.black,
                labelPadding: EdgeInsets.zero,
                enableFeedback: false,
                unselectedLabelStyle: AppTextStyles.customText16(color: Color(0xff515151).withOpacity(0.5), fontWeight: FontWeight.w500, height: 1.5),
                splashFactory: NoSplash.splashFactory,
                overlayColor: const WidgetStatePropertyAll<Color>(Colors.transparent),
                indicatorSize: TabBarIndicatorSize.label,
                dividerColor: Color(0xff00A8A8).withOpacity(0.09),
                unselectedLabelColor: Color(0xff515151).withOpacity(0.5),
                labelStyle: AppTextStyles.customText16(color: AppColors.black, fontWeight: FontWeight.w500, height: 1.5),
                indicator: UnderlineTabIndicator(
                  insets: EdgeInsets.symmetric(horizontal: 60.w),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20.sp), topLeft: Radius.circular(20.sp)),
                  borderSide: BorderSide(color: AppColors.primary, width: 5.h),
                ),
                onTap: (index) async {},
              ),
            ).animate().fadeIn(duration: 300.ms).slideY(begin: -0.2, end: 0, curve: Curves.fastOutSlowIn),
            15.h.height,
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: tabController,
                children: [
                  ListView.builder(
                    itemCount: bookingsData.length,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final booking = bookingsData[index];
                      return BookingDetailTile(
                        isCarBooking: booking["isCarBooking"] as bool,
                        title: booking["title"] as String,
                        image: booking["image"] as String,
                        location: booking["location"] as String,
                        price: booking["price"] as String,
                        subtitle: booking["subtitle"] as String,
                      );
                    },
                  ).paddingHorizontal(15.w),
                  ListView.builder(
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
                  ).paddingHorizontal(15.w),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
