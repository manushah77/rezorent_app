import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_text_style.dart';
import '../../../custom_widgets/custom_app_bar.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  final List<NotificationItem> notifications = [
    NotificationItem(message: "Booking confirmed Paradise Resort, El\nNido", date: "2m ago", isRead: false),
    NotificationItem(message: "Your booking has been canceled.", date: "2m ago", isRead: false),
    NotificationItem(message: "Booking confirmed Paradise Resort, El\nNido", date: "2m ago", isRead: false),
    NotificationItem(message: "Your booking has been canceled.", date: "2m ago", isRead: false),
    NotificationItem(message: "Booking confirmed Paradise Resort, El\nNido", date: "2m ago", isRead: false),
    NotificationItem(message: "Your booking has been canceled.", date: "2m ago", isRead: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Notifications", backgroundColor: Colors.white),
      backgroundColor: AppColors.white,
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return NotificationCard(notification: notifications[index]);
        },
      ).paddingTop(20.h).paddingHorizontal(15.w),
    );
  }
}

class NotificationItem {
  final String message;
  final String date;
  final bool isRead;

  NotificationItem({required this.message, required this.date, required this.isRead});
}

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBgColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(14.w, 6.h, 14.w, 14.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Notification Icon
            SvgPicture.asset(
              AppAssets.icNotification,
            ),
            12.w.width,

            /// Message + Time
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Message
                  Text(
                    notification.message,
                    style: AppTextStyles.customText14(
                      color: AppColors.textLightBlack,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                    ),
                  ),
                  4.height,

                  /// Time
                  Text(
                    notification.date,
                    style: AppTextStyles.customText12(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).paddingTop(8.h),
      ),
    );
  }
}
