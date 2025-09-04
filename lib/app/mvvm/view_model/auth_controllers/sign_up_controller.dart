import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rezorent_app/app/services/logger_service.dart';

class SignUpController extends GetxController {
  RxBool obscureText = true.obs;
  RxBool confirmObscureText = true.obs;
  final ImagePicker picker = ImagePicker();
  Rx<File?> rXfile = Rx<File?>(null);

  // --------------------- Image Picker ---------------------
  Future<bool> pickImageFromGallery() async {
    try {
      rXfile.value = null;
      final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        rXfile.value = File(pickedFile.path);
        return true;
      }
      return false;
    } catch (e) {
      LoggerService.e('Error picking image: $e');
      return false;
    }
  }

  Future<bool> pickImageFromCamera() async {
    try {
      rXfile.value = null;
      final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        rXfile.value = File(pickedFile.path);
        return true;
      }
      return false;
    } catch (e) {
      LoggerService.e('Error picking image: $e');
      return false;
    }
  }
}
