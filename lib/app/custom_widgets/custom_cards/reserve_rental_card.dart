import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';

import '../../config/app_assets.dart';
import '../../config/app_colors.dart';
import '../../config/app_text_style.dart';
import '../app_custom_button.dart';
import '../custom_cache_image/custom_cached_image.dart';

class ReserveRentalCard extends StatelessWidget {
  final String title;
  final String location;
  final String imageUrl;
  final String logoUrl;
  final String buttonText;
  final VoidCallback onReserveNow;
  final VoidCallback onPressed;

  const ReserveRentalCard({
    Key? key,
    required this.title,
    required this.location,
    required this.imageUrl,
    required this.logoUrl,
    required this.buttonText,
    required this.onReserveNow,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomCachedImage(
              height: 200.h,
              width: 1.sw,
              imageUrl: imageUrl,
              borderRadius: 0,
            ),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.customText(
                          color: AppColors.darkTextColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                        ),
                      ),

                      /// Location
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppAssets.locationIcon,
                            color: AppColors.darkTextColor,
                            height: 20.sp,
                            width: 20.sp,
                          ),
                          9.w.width,
                          Expanded(
                            child: Text(
                              location,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.customText(
                                color: AppColors.darkTextColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                10.w.width,

                /// Company Logo
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.sp),
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: CustomCachedImage(
                    height: 52.sp,
                    width: 58.sp,
                    imageUrl: logoUrl,
                    borderRadius: 8,
                  ),
                ),
              ],
            ).paddingVertical(10.h).paddingHorizontal(12.w),

            /// Divider
            Divider(color: AppColors.borderColor).paddingHorizontal(12.w),

            /// Action Button
            AppCustomButton(
              borderRadius: 8.sp,
              title: buttonText,
              onPressed: onReserveNow,
            ).paddingVertical(10.h).paddingHorizontal(12.w),
          ],
        ),
      ),
    );
  }
}
