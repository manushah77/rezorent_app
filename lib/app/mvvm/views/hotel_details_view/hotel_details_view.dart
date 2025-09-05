import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rezorent_app/app/config/app_assets.dart';
import 'package:rezorent_app/app/config/app_text_style.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/custom_widgets/app_custom_button.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_routes.dart';
import '../../../custom_widgets/custom_app_bar.dart';
import '../../../custom_widgets/custom_auto_scroll_widget.dart';
import '../../../custom_widgets/custom_back_button.dart';
import '../../../custom_widgets/custom_cards/reserve_rental_card.dart';

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
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.white,
              surfaceTintColor: Colors.transparent,
              leadingWidth: 70.w,
              leading: Container(
                color: Colors.transparent,
                child: Center(
                  child: SizedBox(width: 40.sp, height: 40.sp, child: CustomBackButton(isWhite: false)).paddingLeft(5.w),
                ),
              ),
              centerTitle: true,
              title: Text(
                "Hotel Details",
                textAlign: TextAlign.center,
                style: AppTextStyles.customText(fontSize: 24, color: AppColors.black, fontWeight: FontWeight.w600, fontFamily: 'MontDark'),
              ),
              pinned: false,
              floating: true,
              snap: true,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  CarCarouselWidget(carImages: hotelImages, carName: carName, location: location, pricePerNight: pricePerNight, borderRadius: 0),
                  SizedBox(height: 10.h),
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
                        AppCustomButton(
                          title: "Reserve Now",
                          onPressed: () {
                            Get.toNamed(AppRoutes.selectRoomView);
                          },
                        ),
                      ],
                    ).paddingFromAll(10.sp),
                  ).paddingHorizontal(10.w),
                  SizedBox(height: 10.h),
                ],
              ).paddingVertical(10.h).paddingHorizontal(5.w),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverTabBarDelegate(
                tabBar: TabBar(
                  controller: tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  isScrollable: false,
                  tabs: tabs.map((tab) {
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
                    insets: EdgeInsets.symmetric(horizontal: 20.w),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20.sp), topLeft: Radius.circular(20.sp)),
                    borderSide: BorderSide(color: AppColors.primary, width: 5.h),
                  ),
                  onTap: (index) {
                    setState(() {
                      tabController?.index = index;
                    });
                  },
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                if (tabController?.index == 0)
                  Column(
                    children: [
                      10.h.height,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'About This Hotel',
                          style: AppTextStyles.customText18(color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                      ),
                      7.h.height,
                      Text(
                        "Comfortable Accommodations: Aqueduct inn in Gjirokaster offers family rooms with private bathrooms, air-conditioning, and free WiFi throughout the property. Each room includes a work desk, seating area, and soundproofing for a pleasant stay.  Relaxing Facilities: Guests can unwind on the sun terrace or enjoy the bar. Additional amenities include a hot tub, balcony with garden or mountain views, and a fireplace. Free on-site parking is available for convenience.  Dining Experience: The hotel serves Italian and vegetarian breakfasts, complemented by a minibar and coffee machine. Room service is provided for added comfort. Local Attractions: Zaravina lake is 44 km away, offering scenic views. Castles and landmarks enhance the surrounding area, making it a highly rated choice for visitors.",
                        style: AppTextStyles.customText14(color: Color(0xff515151)),
                      ),
                      15.h.height,
                    ],
                  ).paddingHorizontal(16.w),
                if (tabController?.index == 1)
                  Column(
                    children: [
                      10.h.height,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Most Popular Facilities',
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(AppAssets.wifiIcon),
                                    15.w.width,
                                    Text('Free WiFi', style: AppTextStyles.customText16(color: Color(0xff515151))),
                                  ],
                                ),
                                15.h.height,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(AppAssets.taxiIcon),
                                    15.w.width,
                                    Text('Taxi Services', style: AppTextStyles.customText16(color: Color(0xff515151))),
                                  ],
                                ),
                                15.h.height,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(AppAssets.parkingIcon),
                                    15.w.width,
                                    Text('Free Parking', style: AppTextStyles.customText16(color: Color(0xff515151))),
                                  ],
                                ),
                                15.h.height,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(AppAssets.breakfastIcon),
                                    15.w.width,
                                    Text('Breakfast', style: AppTextStyles.customText16(color: Color(0xff515151))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(AppAssets.airportIcon),
                                    15.w.width,
                                    Text('Airport Shuttle', style: AppTextStyles.customText16(color: Color(0xff515151))),
                                  ],
                                ),
                                15.h.height,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(AppAssets.foodIcon),
                                    15.w.width,
                                    Text('Food Services', style: AppTextStyles.customText16(color: Color(0xff515151))),
                                  ],
                                ),
                                15.h.height,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(AppAssets.fitnessIcon),
                                    15.w.width,
                                    Text('Fitness Center', style: AppTextStyles.customText16(color: Color(0xff515151))),
                                  ],
                                ),
                                15.h.height,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(AppAssets.barIcon),
                                    15.w.width,
                                    Text('Bar', style: AppTextStyles.customText16(color: Color(0xff515151))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      15.h.height,
                    ],
                  ).paddingHorizontal(16.w),
                if (tabController?.index == 2)
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
                        imageUrl: "https://images.pexels.com/photos/164595/pexels-photo-164595.jpeg",
                        logoUrl: "https://marketplace.canva.com/EAFyLnK08nw/1/0/1600w/canva-beige-black-simple-modern-car-rental-logo-yPiPBx-aXso.jpg",
                        buttonText: "Reserve Now",
                        onPressed: () {
                          Get.toNamed(AppRoutes.roomDetailsView);
                        },
                        onReserveNow: () {
                          Get.toNamed(AppRoutes.paymentView);
                        },
                      );
                    },
                  ).paddingHorizontal(15.w),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.customText16(color: AppColors.darkTextColor.withOpacity(0.7), fontWeight: FontWeight.w500),
            ),
            Text(
              value,
              style: AppTextStyles.customText16(color: AppColors.darkTextColor, fontWeight: FontWeight.w600),
            ),
          ],
        ).paddingVertical(5.h),
        Divider(color: AppColors.borderColor),
      ],
    );
  }

  Widget _buildDescriptionContainer(String title, String description) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.all(13.sp),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.sp),
        border: Border.all(color: AppColors.borderColor),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 2, blurRadius: 5, offset: const Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: AppTextStyles.customText(fontSize: 18.sp, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 5.h),
          Text(
            description,
            style: AppTextStyles.customText(fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColors.darkTextColor.withOpacity(0.8)),
          ),
        ],
      ),
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverTabBarDelegate({required this.tabBar});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height + 20.h;

  @override
  double get minExtent => tabBar.preferredSize.height + 20.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
