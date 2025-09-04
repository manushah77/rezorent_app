import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rezorent_app/app/config/app_assets.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/custom_widgets/app_custom_button.dart';
import 'package:rezorent_app/app/custom_widgets/custom_cache_image/custom_cached_image.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';

import '../../config/app_colors.dart';
import '../../config/app_text_style.dart';

class BookingDetailTile extends StatelessWidget {
  final String? title;
  final String? location;
  final String? subtitle;
  final String? image;
  final String? price;
  final bool? isCarBooking;
  final bool? isHistory;
  final String? status;

  const BookingDetailTile({super.key, this.title, this.location, this.subtitle, this.image, this.isCarBooking, this.isHistory, this.status, this.price});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(4.sp)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomCachedImage(height: 105.h, width: 106.w, imageUrl: image ?? '', borderRadius: 3.sp),
              10.w.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? '',
                    style: AppTextStyles.customText18(color: AppColors.black, fontWeight: FontWeight.w600),
                  ),
                  3.h.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      isCarBooking ?? false ? SizedBox.shrink() : SvgPicture.asset(AppAssets.locationIcon),
                      isCarBooking ?? false ? SizedBox.shrink() : 3.w.width,
                      SizedBox(
                        width: 170.w,
                        child: isCarBooking ?? false
                            ? Text(subtitle ?? '', style: AppTextStyles.customText12(color: Color(0xff515151)))
                            : Text(
                                location ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.customText12(color: AppColors.black, fontWeight: FontWeight.w400),
                              ),
                      ),
                    ],
                  ),
                  3.h.height,
                  SizedBox(
                    width: 190.w,
                    child: Divider(color: Colors.black.withOpacity(0.13)),
                  ),
                  isCarBooking ?? false ? SizedBox.shrink() : Text(subtitle ?? '', style: AppTextStyles.customText10(color: Color(0xff515151))),
                  10.h.height,
                  status == 'active'
                      ? SizedBox.shrink()
                      : Row(
                          children: [
                            isCarBooking ?? false ? Text("/day", style: AppTextStyles.customText14(color: AppColors.textDarkColor)) : SizedBox.shrink(),
                            Text(
                              "\$$price",
                              style: AppTextStyles.customText20(color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                ],
              ),
            ],
          ).paddingFromAll(10.sp),
        ),
        Positioned(
          right: 10.w,
          bottom: isCarBooking ?? false ? 16.h : 10.h,
          child: status == 'active'
              ? Row(
                  children: [
                    isCarBooking ?? false ? Text("/day", style: AppTextStyles.customText14(color: AppColors.textDarkColor)) : SizedBox.shrink(),
                    Text(
                      "\$$price",
                      style: AppTextStyles.customText20(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              : AppCustomButton(
                  height: 30.h,
                  width: 70.w,
                  bgColor: Color(0xffF2FAFA),
                  textStyle: AppTextStyles.customText14(color: Colors.black, fontWeight: FontWeight.w600),
                  title: 'Cancel',
                  borderColor: Colors.black.withOpacity(0.1),
                  onPressed: () {},
                ),
        ),
      ],
    ).paddingBottom(10.h);
  }
}
