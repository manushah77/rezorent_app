import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'app/app_widget.dart';
import 'app/services/notifications_services/notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(RezoRentApp());

  // runApp(
  //   DevicePreview(
  //     enabled: true, // Only enable in debug/profile mode
  //     builder: (context) => ProxixApp(), // Your main app
  //   ),
  // );
}
