import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rezorent_app/app/config/app_assets.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';
import '../../../custom_widgets/app_custom_button.dart';
import '../../../custom_widgets/app_custom_field.dart';
import '../../../custom_widgets/custom_back_button.dart';
import '../../view_model/booking_details/booking_details_controller.dart';

class BookingDetailsView extends StatelessWidget {
  const BookingDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingDetailsController());

    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 6.h, left: 6.w, right: 6.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.sp)),
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [CustomBackButton()]),
                    6.h.height,
                    Text(
                      'Booking Details',
                      style: AppTextStyles.customText(fontSize: 24.sp, fontWeight: FontWeight.bold, color: AppColors.black),
                    ),
                    Text(
                      'Enter Your Information',
                      style: AppTextStyles.customText(fontSize: 16.sp, color: AppColors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),

          10.h.height,
          Expanded(
            child: SafeArea(
              top: false,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Hotel card
                      Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 4.r, offset: Offset(0, 2.h))],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 60.w,
                              height: 60.h,
                              decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(10.r)),
                              child: Center(
                                child: SvgPicture.asset(AppAssets.locationIcon, color: Colors.white, height: 24.sp),
                              ),
                            ),
                            SizedBox(width: 7.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.hotelName,
                                    style: AppTextStyles.customText(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black,
                                      height: 1.2,
                                    ),
                                  ),

                                  Text(
                                    controller.location,
                                    style: AppTextStyles.customText(fontSize: 12.sp, color: AppColors.grey),
                                  ),
                                  Text(
                                    controller.dateGuests,
                                    style: AppTextStyles.customText(fontSize: 12.sp, color: AppColors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  controller.hotelTotal,
                                  style: AppTextStyles.customText(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.black),
                                ),
                                Text(
                                  'Total',
                                  style: AppTextStyles.customText(fontSize: 12.sp, color: AppColors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Container(
                        padding: EdgeInsets.all(14.w),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 4.r, offset: Offset(0, 2.h))],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Primary Guest Information',
                              style: AppTextStyles.customText(fontSize: 16.sp, fontWeight: FontWeight.w600, color: AppColors.black),
                            ),
                            SizedBox(height: 12.h),
                            Row(
                              children: [
                                Expanded(
                                  child: AppCustomField(
                                    fillColor: AppColors.white,
                                    enabledBorderColor: AppColors.borderColor,
                                    enabledBorder: 10.sp,
                                    controller: controller.firstNameController,
                                    hintText: 'Enter Name',
                                    labelText: 'First Name',
                                    labelTitle: 'First Name',
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: AppCustomField(
                                    controller: controller.lastNameController,
                                    hintText: 'Enter Name',

                                    fillColor: AppColors.white,
                                    enabledBorderColor: AppColors.borderColor,
                                    enabledBorder: 10.sp,
                                    labelText: 'Last Name',
                                    labelTitle: 'Last Name',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 05.h),
                            AppCustomField(
                              fillColor: AppColors.white,
                              enabledBorderColor: AppColors.borderColor,
                              enabledBorder: 10.sp,
                              controller: controller.emailController,
                              hintText: 'Enter Email Address',
                              labelText: 'Email Address',
                              labelTitle: 'Email Address',
                            ),
                            SizedBox(height: 05.h),
                            AppCustomField(
                              fillColor: AppColors.white,
                              enabledBorderColor: AppColors.borderColor,
                              enabledBorder: 10.sp,
                              controller: controller.phoneController,
                              hintText: 'Enter Phone Number',
                              labelText: 'Phone Number',
                              labelTitle: 'Phone Number',
                            ),
                            SizedBox(height: 05.h),
                            AppCustomField(
                              minLines: 4,
                              fillColor: AppColors.white,
                              enabledBorderColor: AppColors.borderColor,
                              enabledBorder: 10.sp,
                              controller: controller.specialRequestsController,
                              hintText: 'Any special requests or preferences...',
                              labelText: 'Special Requests (Optional)',
                              labelTitle: "Special Requests (Optional)",
                              maxLines: 5,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h),

                      Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 4.r, offset: Offset(0, 2.h))],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Select Date',
                              style: AppTextStyles.customText(fontSize: 16.sp, fontWeight: FontWeight.w600, color: AppColors.black),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.chevron_left, color: AppColors.grey),
                                  onPressed: () {
                                    controller.focusedDay.value = DateTime(controller.focusedDay.value.year, controller.focusedDay.value.month - 1);
                                    controller.onPageChanged(controller.focusedDay.value);
                                  },
                                ),
                                Obx(() {
                                  return Text(
                                    DateFormat('MMMM, yyyy').format(controller.focusedDay.value),
                                    style: AppTextStyles.customText(fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.black),
                                  );
                                }),
                                IconButton(
                                  icon: Icon(Icons.chevron_right, color: AppColors.grey),
                                  onPressed: () {
                                    controller.focusedDay.value = DateTime(controller.focusedDay.value.year, controller.focusedDay.value.month + 1);
                                    controller.onPageChanged(controller.focusedDay.value);
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Obx(() {
                              return TableCalendar(
                                firstDay: DateTime.utc(2025, 1, 1),
                                lastDay: DateTime.utc(2025, 12, 31),
                                availableGestures: AvailableGestures.horizontalSwipe,
                                focusedDay: controller.focusedDay.value,
                                calendarFormat: controller.calendarFormat.value,
                                startingDayOfWeek: StartingDayOfWeek.sunday,
                                rangeStartDay: controller.rangeStart.value,
                                rangeEndDay: controller.rangeEnd.value,
                                onDaySelected: controller.onDaySelected,
                                onPageChanged: controller.onPageChanged,
                                calendarStyle: CalendarStyle(
                                  todayDecoration: BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
                                  selectedDecoration: BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                                  rangeStartDecoration: BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                                  rangeEndDecoration: BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                                  withinRangeDecoration: BoxDecoration(color: AppColors.primary.withOpacity(0), shape: BoxShape.circle),
                                  outsideDaysVisible: false,
                                ),
                                headerVisible: false,
                                daysOfWeekStyle: DaysOfWeekStyle(
                                  dowTextFormatter: (date, locale) => DateFormat.E().format(date),
                                  weekdayStyle: AppTextStyles.customText(fontSize: 14.sp, color: AppColors.grey),
                                  weekendStyle: AppTextStyles.customText(fontSize: 14.sp, color: AppColors.grey),
                                ),
                                calendarBuilders: CalendarBuilders(
                                  defaultBuilder: (context, date, _) {
                                    return Center(
                                      child: Text(
                                        '${date.day}',
                                        style: AppTextStyles.customText(fontSize: 14.sp, color: AppColors.black),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Container(
                        padding: EdgeInsets.all(16.sp),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 4.r, offset: Offset(0, 2.h))],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your Search Payment Summary',
                              style: AppTextStyles.customText(fontSize: 16.sp, fontWeight: FontWeight.w600, color: AppColors.black),
                            ),
                            SizedBox(height: 12.h),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Check-in',
                                        style: AppTextStyles.customText(fontSize: 14.sp, color: AppColors.grey),
                                      ),
                                      Text(
                                        controller.checkIn,
                                        style: AppTextStyles.customText(fontSize: 14.sp, color: AppColors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Check-out',
                                        style: AppTextStyles.customText(fontSize: 14.sp, color: AppColors.grey),
                                      ),
                                      Text(
                                        controller.checkOut,
                                        style: AppTextStyles.customText(fontSize: 14.sp, color: AppColors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Travelers',
                                        style: AppTextStyles.customText(fontSize: 14.sp, color: AppColors.grey),
                                      ),
                                      Text(
                                        controller.travelers,
                                        style: AppTextStyles.customText(fontSize: 14.sp, color: AppColors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Total length of Stay',
                                        style: AppTextStyles.customText(fontSize: 14.sp, color: AppColors.grey),
                                      ),
                                      Text(
                                        controller.stayLength,
                                        style: AppTextStyles.customText(fontSize: 14.sp, color: AppColors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            DottedLine(dashColor: AppColors.borderColor),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total Payable',
                                  style: AppTextStyles.customText(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.black),
                                ),
                                Text(
                                  controller.totalPayable,
                                  style: AppTextStyles.customText(fontSize: 24.sp, fontWeight: FontWeight.bold, color: AppColors.primary),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Container(
                        padding: EdgeInsets.all(16.sp),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 4.r, offset: Offset(0, 2.h))],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'By proceeding with this booking, you agree to our:',
                              style: AppTextStyles.customText(fontSize: 14.sp, color: AppColors.black),
                            ),
                            4.h.height,
                            Row(
                              children: [
                                Text(
                                  'Terms of Service',
                                  style: AppTextStyles.customText(fontSize: 12.sp, color: AppColors.primary, fontWeight: FontWeight.w600),
                                ),
                                10.w.width,
                                Text(
                                  'Privacy Policy',
                                  style: AppTextStyles.customText(fontSize: 12.sp, color: AppColors.primary, fontWeight: FontWeight.w600),
                                ),

                                10.w.width,
                                Text(
                                  'Cancellation Policy',
                                  style: AppTextStyles.customText(fontSize: 12.sp, color: AppColors.primary, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24.h),
                      AppCustomButton(
                        title: 'Continue to Payment',
                        onPressed: () {
                          // Handle payment logic
                        },
                      ),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
