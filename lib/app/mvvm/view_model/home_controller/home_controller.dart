import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();
  RxInt childrenCount = 0.obs;
  RxInt adultsCount = 0.obs;
  RxInt infantCount = 0.obs;
}
