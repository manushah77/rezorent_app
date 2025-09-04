import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rezorent_app/app/config/app_assets.dart';
import 'package:rezorent_app/app/config/app_colors.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/custom_widgets/app_custom_field.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';

class HotelsTab extends StatefulWidget {
  const HotelsTab({super.key});

  @override
  State<HotelsTab> createState() => _HotelsTabState();
}

class _HotelsTabState extends State<HotelsTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: AppCustomField(
                  titleWidget: SizedBox.shrink(),
                  enabledBorder: 50.sp,
                  disabledBorder: 50.sp,
                  enabledBorderColor: Color(0xffD9D9D9),
                  focusedBorder: 50.sp,
                  focusedBorderColor: AppColors.primary,
                  textInputAction: TextInputAction.search,
                  prefixIcon: SvgPicture.asset(AppAssets.searchIcon).paddingFromAll(10.sp),
                  hintText: 'Search Here...',
                  fillColor: Colors.transparent,
                ),
              ),
              7.w.width,
              Container(
                height: 50.sp,
                width: 50.sp,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xffD9D9D9)),
                  color: Colors.transparent,
                ),
                child: Center(child: SvgPicture.asset(AppAssets.filterIcon)),
              ),
            ],
          ),
        ],
      ).paddingHorizontal(15.w),
    );
  }
}
