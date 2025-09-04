import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../config/app_colors.dart';
import '../../config/app_text_style.dart';

Future<DateTime?> ShowDatePicker(BuildContext context) {
  // Normalize current date (remove microseconds/nanoseconds)
  DateTime now = DateTime.now();
  DateTime normalizedNow = DateTime(now.year, now.month, now.day);

  DateTime selectedDate = normalizedNow;

  return showDialog<DateTime>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: AppColors.white,
        child: SizedBox(
          height: 320,
          child: Column(
            children: [
              // Header
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context, null),
                      child: Text(
                        "Cancel",
                        style: AppTextStyles.customText16(color: AppColors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context, selectedDate),
                      child: Text(
                        "Select",
                        style: AppTextStyles.customText16(color: AppColors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),

              // Date Picker
              Expanded(
                child: CupertinoTheme(
                  data: CupertinoThemeData(
                    primaryColor: AppColors.primary,
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: AppTextStyles.customText20(color: AppColors.primary, fontWeight: FontWeight.w500),
                    ),
                  ),
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: normalizedNow,
                    minimumDate: normalizedNow,
                    maximumDate: DateTime(2100),
                    onDateTimeChanged: (DateTime dateTime) {
                      selectedDate = dateTime;
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<String?> showCustomTimePicker(BuildContext context) {
  TimeOfDay selectedTime = TimeOfDay.now();

  return showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: AppColors.white,
        child: SizedBox(
          height: 320,
          child: Column(
            children: [
              // Header
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context, null),
                      child: Text(
                        "Cancel",
                        style: AppTextStyles.customText16(color: AppColors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        final now = DateTime.now();
                        final formatted = DateFormat.jm().format(DateTime(now.year, now.month, now.day, selectedTime.hour, selectedTime.minute));
                        Navigator.pop(context, formatted);
                      },
                      child: Text(
                        "Select",
                        style: AppTextStyles.customText16(color: AppColors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),

              // Time Picker
              Expanded(
                child: CupertinoTheme(
                  data: CupertinoThemeData(
                    primaryColor: AppColors.primary,
                    textTheme: CupertinoTextThemeData(
                      dateTimePickerTextStyle: AppTextStyles.customText20(color: AppColors.primary, fontWeight: FontWeight.w500),
                    ),
                  ),
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.time,
                    initialDateTime: DateTime.now(),
                    use24hFormat: false, // ✅ Show AM/PM
                    onDateTimeChanged: (DateTime dateTime) {
                      selectedTime = TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
