import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/app_colors.dart';
import 'config/app_routes.dart';
import 'package:get/get.dart';

class RezoRentApp extends StatefulWidget {
  const RezoRentApp({super.key});

  @override
  State<RezoRentApp> createState() => _RezoRentAppState();
}

class _RezoRentAppState extends State<RezoRentApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.scaffoldBgColor,
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
            useMaterial3: true,
          ),
          initialRoute: AppRoutes.splashOneView,
          getPages: AppPages.routes,
          title: "REZO",
        );
      },
    );
  }
}
