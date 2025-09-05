import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rezorent_app/app/config/app_routes.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/config/utils.dart';
import 'package:rezorent_app/app/custom_widgets/app_custom_button.dart';
import 'package:rezorent_app/app/custom_widgets/custom_back_button.dart';
import 'package:rezorent_app/app/custom_widgets/custom_sheets/info_sheet.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';
import 'package:rezorent_app/app/mvvm/view_model/car_rental_details/car_rental_details_controller.dart';
import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';
import '../../../custom_widgets/custom_auto_scroll_widget.dart';
import '../../../custom_widgets/custom_cache_image/custom_cached_image.dart';
import '../../../custom_widgets/custom_cards/reserve_rental_card.dart';
// import 'car_carousel_widget.dart';

class CarRentalDetailsView extends StatefulWidget {
  const CarRentalDetailsView({super.key});

  @override
  State<CarRentalDetailsView> createState() => _CarRentalDetailsViewState();
}

class _CarRentalDetailsViewState extends State<CarRentalDetailsView> with SingleTickerProviderStateMixin {
  late TabController tabController;
  final CarRentalDetailsController controller = Get.find();
  final List<String> carImages = [
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
  final String carName = 'Suzuki DZIRE';
  final String location = 'street 2, Tirane, 1001 Tirana, Albania';
  final String pricePerNight = '\$12/per night';
  final List<Tab> tabs = const [Tab(text: "Overview"), Tab(text: "Amenities"), Tab(text: "Vehicles")];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
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
              title: Text(
                "Car Details",
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
                                SizedBox(width: 9.w),
                                Text(
                                  "Lagjia Partizani, Rruga Sheza.",
                                  style: AppTextStyles.customText(color: AppColors.darkTextColor, fontWeight: FontWeight.w500, fontSize: 14.sp),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.sp),
                          border: Border.all(color: AppColors.borderColor),
                        ),
                        child: CustomCachedImage(
                          height: 52.sp,
                          width: 58.sp,
                          imageUrl:
                              "https://marketplace.canva.com/EAFyLnK08nw/1/0/1600w/canva-beige-black-simple-modern-car-rental-logo-yPiPBx-aXso.jpg",
                          borderRadius: 8,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  CarCarouselWidget(carImages: carImages, carName: carName, location: location, pricePerNight: pricePerNight),
                  SizedBox(height: 10.h),
                  Container(
                    width: 1.sw,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.sp),
                      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 2, blurRadius: 5, offset: const Offset(0, 3))],
                    ),
                    padding: EdgeInsets.all(14.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Price details",
                          style: AppTextStyles.customText16(color: AppColors.darkTextColor, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 2.h),
                        Divider(color: AppColors.borderColor),
                        SizedBox(height: 10.h),
                        _buildDetailRow("Price", "\$30.00 x 6 Day"),
                        SizedBox(height: 10.h),
                        _buildDetailRow("Insurance", "\$800"),
                        SizedBox(height: 10.h),
                        _buildDetailRow("Driver Fees", "\$18.00 x 6 Day"),
                        Row(
                          children: [
                            Obx(() {
                              return _buildDriverOption(
                                value: true,
                                groupValue: controller.withDriver.value,
                                onChanged: (newValue) {
                                  setState(() {
                                    controller.withDriver.value = newValue!;
                                  });
                                },
                                title: "With Driver",
                              );
                            }),
                            Obx(() {
                              return _buildDriverOption(
                                value: false,
                                groupValue: controller.withDriver.value,
                                onChanged: (newValue) {
                                  setState(() {
                                    controller.withDriver.value = newValue!;
                                  });
                                },
                                title: "Without Driver",
                              );
                            }),
                            SizedBox(width: 6.w),
                            GestureDetector(
                              onTap: () {
                                // Add info action
                                Utils.showBottomSheet(context: context, child: InfoSheet());
                              },
                              child: Icon(CupertinoIcons.info_circle, color: AppColors.darkTextColor, size: 18.sp),
                            ),
                          ],
                        ),
                        Divider(color: AppColors.borderColor),
                        SizedBox(height: 10.h),
                        AppCustomButton(onPressed: () {
                          Get.toNamed(AppRoutes.bookingDetailsView);
                        }, title: "Reserve Now"),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ).paddingVertical(10.h).paddingHorizontal(16.w),
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
                  unselectedLabelStyle: AppTextStyles.customText16(
                    color: Color(0xff515151).withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
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
                      tabController.index = index;
                    });
                  },
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                if (tabController.index == 0)
                  Column(
                    children: [
                      _buildDescriptionContainer(
                        "Things to know",
                        """After your booking is confirmed, if you need to cancel, simply get in touch with the dealer. They'll work with you to find a solution that aligns with their company policies.\n\nPlease make sure to bring your driver’s license and present it at the rental company upon arrival.""",
                      ),
                      SizedBox(height: 10.h),
                      _buildDescriptionContainer(
                        "Insurance information",
                        """For comprehensive details on insurance options in Albania, kindly visit the provided link. Should you require tailored assistance or have specific inquiries, we encourage you to reach out directly to the respective car rental company for personalized guidance.""",
                      ),
                      SizedBox(height: 12.h),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(color: AppColors.borderColor),
                          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 2, blurRadius: 5, offset: const Offset(0, 3))],
                        ),
                        padding: EdgeInsets.all(12.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your booking details",
                              style: AppTextStyles.customText18(color: AppColors.darkTextColor, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 7.h),
                            Divider(color: AppColors.borderColor),
                            _buildDetailColumn("Pick-up Location", "Airport, Albania"),
                            _buildDetailColumn("Pick-up Date & Time", "Friday 23 May 10:00"),
                            _buildDetailColumn("Drop-off Date & Time", "Monday 29 May 18:00"),
                          ],
                        ),
                      ),
                    ],
                  ).paddingHorizontal(16.w),
                if (tabController.index == 1)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Ford Focus ST",
                                  style: AppTextStyles.customText(color: AppColors.darkTextColor, fontWeight: FontWeight.w700, fontSize: 20.sp),
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(AppAssets.locationIcon, color: AppColors.darkTextColor, height: 20.sp, width: 20.sp),
                                    SizedBox(width: 9.w),
                                    Text(
                                      "Mountain Drive Rentals.",
                                      style: AppTextStyles.customText(color: AppColors.darkTextColor, fontWeight: FontWeight.w500, fontSize: 14.sp),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.sp),
                              border: Border.all(color: AppColors.borderColor),
                            ),
                            child: CustomCachedImage(
                              height: 52.sp,
                              width: 58.sp,
                              imageUrl:
                                  "https://marketplace.canva.com/EAFyLnK08nw/1/0/1600w/canva-beige-black-simple-modern-car-rental-logo-yPiPBx-aXso.jpg",
                              borderRadius: 8,
                            ),
                          ),
                        ],
                      ),
                      8.h.height,

                      Row(
                        children: [
                          _buildIconRow("5 Seats", AppAssets.seatsIcon),
                          5.w.width,
                          _buildIconRow("Roof Rack", AppAssets.roofRackIcon),
                          5.w.width,
                          _buildIconRow("Petrol", AppAssets.petrolIcon),
                        ],
                      ),
                      6.h.height,

                      Row(
                        children: [
                          _buildIconRow("Manual", AppAssets.manualIcon),
                          5.w.width,
                          _buildIconRow("Car Heater", AppAssets.temperatureIcon),
                          5.w.width,
                          _buildIconRow("Airbags", AppAssets.airBagsIcon),
                        ],
                      ),

                      15.h.height,
                      Text(
                        "Other Details",
                        style: AppTextStyles.customText18(color: AppColors.darkTextColor, fontWeight: FontWeight.w600),
                      ),
                      5.h.height,

                      Text(
                        "After your booking is confirmed, if you need to cancel, simply get in touch with the dealer. They'll work with you to find a solution that aligns with their company policies.",
                        style: AppTextStyles.customText16(color: AppColors.darkTextColor.withOpacity(0.7), fontWeight: FontWeight.w500),
                      ),
                    ],
                  ).paddingHorizontal(16.w),
                if (tabController.index == 2)
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Other Vehicles by This Company",
                              style: AppTextStyles.customText(fontSize: 16.sp, fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(width: 6.w),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.selectCarView);
                            },
                            child: Row(
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
                          ),
                        ],
                      ),
                      6.h.height,
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return ReserveRentalCard(
                            isForHotel: false,
                            title: "Hyundai I30",
                            location: "Lagjia Partizani, Rruga Sheza.",
                            imageUrl:
                                "https://cdn.cars24.com/prod/new-car-cms/Maruti-Suzuki/New-Dzire/2024/11/12/f2f7185b-e5a2-45a4-ba32-2b9a066feeee-Car-dynamic-shot-680x601-_1_.jpg",
                            logoUrl:
                                "https://marketplace.canva.com/EAFyLnK08nw/1/0/1600w/canva-beige-black-simple-modern-car-rental-logo-yPiPBx-aXso.jpg",
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
                        },
                      ),
                    ],
                  ).paddingHorizontal(16.w),
              ]),
            ),
          ],
        ),
      ),
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

  Widget _buildIconRow(String title, String iconUrl) {
    return Flexible(
      child: Row(
        children: [
          SvgPicture.asset(iconUrl, color: AppColors.darkTextColor.withOpacity(0.8), height: 20.sp, width: 20.sp),
          SizedBox(width: 9.w),
          Text(
            title,
            style: AppTextStyles.customText(color: AppColors.darkTextColor.withOpacity(0.8), fontWeight: FontWeight.w500, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildDriverOption({required bool value, required bool groupValue, required ValueChanged<bool?> onChanged, required String title}) {
    return Flexible(
      child: ListTile(
        onTap: () {
          onChanged(value);
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        leading: Container(
          height: 18.sp,
          width: 18.sp,
          child: Radio<bool>(value: value, groupValue: groupValue, onChanged: onChanged),
        ),
        horizontalTitleGap: 3.w,
        title: Text(
          title,
          style: AppTextStyles.customText16(color: AppColors.darkTextColor, fontWeight: FontWeight.w500),
        ),
      ),
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
