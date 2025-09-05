import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rezorent_app/app/config/utils.dart';
import 'package:rezorent_app/app/custom_widgets/custom_dialogs/images_details_dialog.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../config/app_assets.dart';
import '../config/app_colors.dart';
import '../config/app_text_style.dart';
import 'custom_cache_image/custom_cached_image.dart';

// Assume these are defined in your project:
// - AppColors
// - AppTextStyles
// - AppAssets
// - CustomCachedImage (e.g., a widget using CachedNetworkImage)

class CarCarouselWidget extends StatefulWidget {
  final List<String> carImages;
  final String carName;
  final String location;
  final String pricePerNight;
  final double? borderRadius;

  const CarCarouselWidget({super.key, required this.carImages, required this.carName, required this.location, required this.pricePerNight, this.borderRadius});

  @override
  State<CarCarouselWidget> createState() => _CarCarouselWidgetState();
}

class _CarCarouselWidgetState extends State<CarCarouselWidget> {
  late PageController _pageController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_pageController.hasClients && mounted) {
        int nextPage = (_pageController.page?.round() ?? 0) + 1;
        if (nextPage >= widget.carImages.length) {
          nextPage = 0;
        }
        _pageController.animateToPage(nextPage, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final int imageCount = widget.carImages.length;
    final double dotWidth = 7.sp;
    final double dotSpacing = 5.sp;
    final double neededWidth = (imageCount * dotWidth) + ((imageCount - 1) * dotSpacing);
    final double horizontalPadding = 24.w; // 12.w on each side
    final double indicatorWidth = neededWidth + horizontalPadding;

    return GestureDetector(
      onTap: () {
        Utils.showCustomDialog(
          context: context,
          child: ImagesDetailsDialog(imageUrls: widget.carImages, initialIndex: 0),
        );
      },
      child: Container(
        height: 0.4.sh,
        width: 1.sw,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(color: AppColors.borderColor, borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.sp)),
        child: Stack(
          children: [
            SizedBox(
              height: 0.4.sh,
              width: 1.sw,
              child: PageView.builder(
                itemCount: imageCount,
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: (index) {
                  _timer?.cancel();
                  _startAutoScroll();
                },
                itemBuilder: (context, index) {
                  return CustomCachedImage(height: 0.4.sh, width: 1.sw, imageUrl: widget.carImages[index], borderRadius: widget.borderRadius ?? 10.sp);
                },
              ),
            ),
            IgnorePointer(
              child: Container(
                height: 0.4.sh,
                width: 1.sw,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColors.transparent, AppColors.transparent, AppColors.black.withOpacity(0.7)],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 12.sp,
              right: 12.sp,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.sp),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                  child: Container(
                    height: 34.sp,
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.sp),
                      color: AppColors.black.withOpacity(0.12),
                      border: Border.all(color: AppColors.white.withOpacity(0.3)),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Center(
                      child: Text(
                        widget.pricePerNight,
                        style: AppTextStyles.customText(fontSize: 12.sp, color: AppColors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.carName,
                      style: AppTextStyles.customText(color: AppColors.white, fontWeight: FontWeight.w700, fontSize: 20.sp),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(AppAssets.locationIcon, color: AppColors.white.withOpacity(0.6), height: 20.sp, width: 20.sp),
                        SizedBox(width: 9.w),
                        Expanded(
                          child: Text(
                            widget.location,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.customText(color: AppColors.white.withOpacity(0.6), fontWeight: FontWeight.w500, fontSize: 14.sp),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Center(
                      child: Container(
                        height: 20.sp,
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.4),
                          border: Border.all(color: AppColors.white.withOpacity(0.5)),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.sp), topRight: Radius.circular(10.sp)),
                        ),
                        clipBehavior: Clip.hardEdge,
                        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                        child: Center(
                          child: SmoothPageIndicator(
                            axisDirection: Axis.horizontal,
                            textDirection: TextDirection.ltr,
                            effect: ScrollingDotsEffect(
                              activeDotColor: AppColors.primary,
                              dotColor: AppColors.white,
                              dotHeight: 7.sp,
                              dotWidth: 7.sp,
                              spacing: 5.sp,
                              activeDotScale: 1.4,
                              // jumpScale: 1.8,
                            ),
                            controller: _pageController,
                            count: imageCount,
                          ),
                        ),
                      ),
                    ),
                  ],
                ).paddingOnly(left: 12.w, right: 12.w),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
