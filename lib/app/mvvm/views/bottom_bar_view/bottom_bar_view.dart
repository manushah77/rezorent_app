import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:rezorent_app/app/mvvm/views/bottom_bar_view/booking_view.dart';
import 'package:rezorent_app/app/mvvm/views/bottom_bar_view/history_view.dart';
import 'package:rezorent_app/app/mvvm/views/bottom_bar_view/home_view.dart';
import 'package:rezorent_app/app/mvvm/views/bottom_bar_view/profile_settings_view.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';
import '../../view_model/bottom_bar_controller/bottom_bar_controller.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({super.key});

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  final BottomBarController controller = Get.find();
  final List<Widget> pages = [HomeView(), BookingView(), HistoryView(), ProfileSettingsView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(extendBody: true, body: Obx(() => pages[controller.selectedIndex.value]), bottomNavigationBar: Obx(() => buildBottomBar()));
  }

  Widget buildBottomBar() {
    return SafeArea(
      child: Container(
        height: 70.h,
        margin: EdgeInsets.only(bottom: 8.sp, left: 22.sp, right: 22.sp),
        padding: EdgeInsets.symmetric(horizontal: 15.sp),
        decoration: BoxDecoration(
          // border: GradientBoxBorder(
          //   gradient: LinearGradient(colors: [Colors.transparent, Colors.black, Colors.transparent]),
          // ),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(38.sp),
          boxShadow: [BoxShadow(offset: Offset(0, -5.h), color: AppColors.black.withOpacity(.1), blurRadius: 10.sp)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildItem(AppAssets.homeIcon, 0),
            buildItem(AppAssets.bookingIcon, 1),
            buildItem(AppAssets.historyIcon, 2),
            buildItem(AppAssets.profileIcon, 3),
          ],
        ),
      ),
    );
  }

  Widget buildItem(String? svg, int index) {
    final isSelected = controller.selectedIndex.value == index;

    return GestureDetector(
      onTap: () => controller.changeView(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 50.sp,
        height: 50.sp,
        decoration: BoxDecoration(color: isSelected ? AppColors.primary : AppColors.scaffoldBgColor, shape: BoxShape.circle),
        child: Padding(
          padding: EdgeInsets.all(12.sp),
          child: SvgPicture.asset(svg ?? '', color: isSelected ? AppColors.white : AppColors.black),
        ),
      ),
    );
  }
}
