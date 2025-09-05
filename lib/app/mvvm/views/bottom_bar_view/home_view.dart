import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rezorent_app/app/config/app_assets.dart';
import 'package:rezorent_app/app/config/app_colors.dart';
import 'package:rezorent_app/app/config/app_routes.dart';
import 'package:rezorent_app/app/config/app_text_style.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/custom_widgets/custom_cache_image/custom_cached_image.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';
import 'package:rezorent_app/app/mvvm/views/home_tabs/cars_tab.dart';
import 'package:rezorent_app/app/mvvm/views/home_tabs/hotels_tab.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  TabController? tabController;
  List tabs = [Tab(text: "Hotel"), Tab(text: "Car Rental")];

  @override
  void initState() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.scaffoldBgColor,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(34.sp), bottomRight: Radius.circular(34.sp)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.primary.withOpacity(0.2)),
                          ),
                          child: CustomCachedImage(
                            height: 45.sp,
                            width: 45.sp,
                            imageUrl: 'imageUrl',
                            borderRadius: 100.sp,
                            name: "Romas Elman",
                          ).paddingFromAll(3.sp),
                        ),
                        10.w.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello Romas',
                              style: AppTextStyles.customText16(color: Color(0xff0C1D24).withOpacity(0.7), fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Good Morning!',
                              style: AppTextStyles.customText22(color: AppColors.secondary, fontWeight: FontWeight.w600, height: 1),
                            ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.notificationView);
                      },
                      child: SvgPicture.asset(AppAssets.notificationIcon),
                    ),
                  ],
                ).paddingHorizontal(12.w).paddingTop(50.h).paddingBottom(40.h),
              ).paddingHorizontal(10.w),
              Positioned(
                bottom: -25.h,
                right: 10.w,
                left: 10.w,
                child: Container(
                  height: 52.h,
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldBgColor,
                    border: Border.all(color: Colors.white, width: 4),
                    borderRadius: BorderRadius.circular(33.sp),
                  ),
                  child: TabBar(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    isScrollable: false,
                    tabs: tabs.map((tab) {
                      int index = tabs.indexOf(tab);
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        // Smooth transition
                        curve: Curves.easeInOut,
                        // Smooth easing effect
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.transparent,
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(33.sp),
                        ),
                        child: Tab(text: tab.text).paddingHorizontal(10.w),
                      ).paddingHorizontal(5.w);
                    }).toList(),
                    controller: tabController,
                    labelColor: AppColors.white,
                    labelPadding: EdgeInsets.zero,
                    enableFeedback: false,
                    unselectedLabelStyle: AppTextStyles.customText14(color: AppColors.secondary, fontWeight: FontWeight.w500, height: 1.5),
                    splashFactory: NoSplash.splashFactory,
                    overlayColor: const WidgetStatePropertyAll<Color>(Colors.transparent),
                    indicatorSize: TabBarIndicatorSize.label,
                    dividerColor: AppColors.transparent,
                    unselectedLabelColor: AppColors.black,
                    labelStyle: AppTextStyles.customText14(color: AppColors.white, fontWeight: FontWeight.w500, height: 1.5),
                    indicator: BoxDecoration(borderRadius: BorderRadius.circular(33.sp), color: AppColors.primary),
                    onTap: (index) {},
                  ).paddingFromAll(5.sp),
                ).paddingHorizontal(20.w),
              ),
            ],
          ),
          30.h.height,
          Expanded(
            child: TabBarView(controller: tabController, children: [HotelsTab(), CarsTab()]),
          ),
        ],
      ),
    );
  }
}
