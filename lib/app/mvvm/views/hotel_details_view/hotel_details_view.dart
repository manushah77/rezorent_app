import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rezorent_app/app/config/app_text_style.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/custom_widgets/app_custom_button.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';

import '../../../config/app_colors.dart';
import '../../../custom_widgets/custom_app_bar.dart';
import '../../../custom_widgets/custom_auto_scroll_widget.dart';

class HotelDetailsView extends StatefulWidget {
  const HotelDetailsView({super.key});

  @override
  State<HotelDetailsView> createState() => _HotelDetailsViewState();
}

class _HotelDetailsViewState extends State<HotelDetailsView> with TickerProviderStateMixin {
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

  TabController? tabController;
  List tabs = [Tab(text: "Overview"), Tab(text: "Amenities"), Tab(text: 'Rooms')];

  @override
  void initState() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: CustomAppBar(title: "Hotel Details", isWhite: false),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              10.h.height,
              CarCarouselWidget(carImages: hotelImages, carName: carName, location: location, pricePerNight: pricePerNight, borderRadius: 0),
              15.h.height,
              Container(
                decoration: BoxDecoration(color: AppColors.scaffoldBgColor, borderRadius: BorderRadius.circular(12.sp)),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Your Search Payment Summary',
                        style: AppTextStyles.customText18(color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ),
                    10.h.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Check-in', style: AppTextStyles.customText14(color: AppColors.textLightBlack)),
                              Text(
                                'Wed 14 May 2025',
                                style: AppTextStyles.customText16(color: Colors.black, fontWeight: FontWeight.w600),
                              ),
                              9.h.height,
                              Text('Travelers', style: AppTextStyles.customText14(color: AppColors.textLightBlack)),
                              Text(
                                '1 room for 2 adults',
                                style: AppTextStyles.customText16(color: Colors.black, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Check-out', style: AppTextStyles.customText14(color: AppColors.textLightBlack)),
                              Text(
                                'Fri 16 May 2025',
                                style: AppTextStyles.customText16(color: Colors.black, fontWeight: FontWeight.w600),
                              ),
                              9.h.height,
                              Text('Total length of Stay', style: AppTextStyles.customText14(color: AppColors.textLightBlack)),
                              Text(
                                '2 nights',
                                style: AppTextStyles.customText16(color: Colors.black, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    10.h.height,
                    DottedLine(dashColor: AppColors.textLightBlack),
                    13.h.height,
                    AppCustomButton(title: "Reserve Now", onPressed: () {}),
                  ],
                ).paddingFromAll(10.sp),
              ).paddingHorizontal(10.w),
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
                      child: Tab(text: tab.text).paddingHorizontal(10.w),
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
                    insets: EdgeInsets.symmetric(horizontal: 30.w),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20.sp), topLeft: Radius.circular(20.sp)),
                    borderSide: BorderSide(color: AppColors.primary, width: 5.h),
                  ),
                  onTap: (index) async {},
                ),
              ),
            ],
          ),
        ).paddingHorizontal(6.w),
      ),
    );
  }
}
