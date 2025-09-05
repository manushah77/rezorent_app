import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingDetailsController extends GetxController {
  // TextEditingControllers for form fields
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController specialRequestsController = TextEditingController();

  // Static data as per the image
  final String hotelName = 'Paradise Beach Resort';
  final String location = 'El Nido, Palawan';
  final String dateGuests = 'Dec 25, 2024 +2 Guests';
  final String hotelTotal = '\$100.00';
  // final String hotelTotal = '₱100.00';
  final String checkIn = 'Wed 14 May 2025';
  final String checkOut = 'Fri 16 May 2025';
  final String travelers = 'Room for 2 Adults';
  final String stayLength = '2 nights';
  final String totalPayable = '\$999.00';
// Date range picker state (already reactive)
  final Rx<DateTime?> selectedStartDate = Rx<DateTime?>(null);
  final Rx<DateTime?> selectedEndDate = Rx<DateTime?>(null);
  final Rx<CalendarFormat> calendarFormat = Rx<CalendarFormat>(CalendarFormat.month);
  final Rx<DateTime> focusedDay = Rx<DateTime>(DateTime(2025, 1, 1));
  final Rx<DateTime?> rangeStart = Rx<DateTime?>(null);
  final Rx<DateTime?> rangeEnd = Rx<DateTime?>(null);

  @override
  void onInit() {
    super.onInit();
    // Initialize with default selected dates as per the image (7 and 10)
    selectedStartDate.value = DateTime(2025, 1, 7);
    selectedEndDate.value = DateTime(2025, 1, 10);
    rangeStart.value = selectedStartDate.value;
    rangeEnd.value = selectedEndDate.value;
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    specialRequestsController.dispose();
    super.onClose();
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (selectedStartDate.value == null) {
      selectedStartDate.value = selectedDay;
      rangeStart.value = selectedDay;
    } else if (selectedEndDate.value == null && selectedDay.isAfter(selectedStartDate.value!)) {
      selectedEndDate.value = selectedDay;
      rangeEnd.value = selectedDay;
    } else {
      selectedStartDate.value = selectedDay;
      selectedEndDate.value = null;
      rangeStart.value = selectedDay;
      rangeEnd.value = null;
    }
    this.focusedDay.value = focusedDay;
    update();
  }

  void onPageChanged(DateTime focusedDay) {
    this.focusedDay.value = focusedDay;
    update();
  }
}