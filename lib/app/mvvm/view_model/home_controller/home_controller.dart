import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();
  RxInt childrenCount = 0.obs;
  RxInt adultsCount = 0.obs;
  RxInt infantCount = 0.obs;
  RxString filterDistanceValue = ''.obs;
  RxBool singleBedValue = false.obs;
  RxBool twinBedValue = false.obs;
  RxBool fullBedValue = false.obs;
  RxBool sofaBedValue = false.obs;
  RxBool kingBedValue = false.obs;
  RxBool bunkBedValue = false.obs;
  RxBool familyBedValue = false.obs;
  RxBool doubleRoomValue = false.obs;
  RxBool singleRoomValue = false.obs;
  RxBool twinRoomValue = false.obs;
  RxBool quadRoomValue = false.obs;
  RxBool familyRoomValue = false.obs;
}
