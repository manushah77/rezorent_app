import 'dart:ui';
import 'package:custom_cached_image/custom_cached_image_with_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImagesDetailsDialog extends StatefulWidget {
  final List<String> imageUrls;
  final int initialIndex; // 🔹 New parameter

  const ImagesDetailsDialog({
    super.key,
    required this.imageUrls,
    required this.initialIndex, // default to 0 if not provided
  });

  @override
  State<ImagesDetailsDialog> createState() => _ImagesDetailsDialogState();
}

class _ImagesDetailsDialogState extends State<ImagesDetailsDialog> {
  late PageController _controller;
  late int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialIndex.clamp(0, widget.imageUrls.length - 1);
    _controller = PageController(initialPage: _currentPage);
  }

  void _goToPrevious() {
    if (_currentPage > 0) {
      _controller.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _goToNext() {
    if (_currentPage < widget.imageUrls.length - 1) {
      _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  Widget _blurredBackground({required Widget child}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.sp),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.15), borderRadius: BorderRadius.circular(50.sp)),
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.imageUrls.isEmpty) {
      return const SizedBox();
    }

    return Stack(
      children: [
        // Fullscreen background image carousel
        SizedBox(
          height: 510.h,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.imageUrls.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return CustomCachedImage(
                fit: BoxFit.cover,
                imageUrl: widget.imageUrls[index],
                height: 450.h,
                width: double.infinity,
                borderRadius: 22.sp,
                isProfile: false,
              );
            },
          ),
        ),

        // 🔹 Top blackish layer
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 120.h,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.sp),
              gradient: const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black54, Colors.transparent]),
            ),
          ),
        ),

        // 🔹 Bottom blackish layer
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 150.h,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.sp),
              gradient: const LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Colors.black54, Colors.transparent]),
            ),
          ),
        ),

        // Top bar with close button
        Positioned(
          top: 10.h,
          right: 10.w,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: _blurredBackground(
              child: Padding(
                padding: EdgeInsets.all(8.sp),
                child: const Icon(Icons.close, color: Colors.white, size: 24),
              ),
            ),
          ),
        ),

        // Previous Arrow
        if (widget.imageUrls.length > 1)
          Positioned(
            left: 20.w,
            top: 0,
            bottom: 0,
            child: Center(
              child: GestureDetector(
                onTap: _goToPrevious,
                child: _blurredBackground(
                  child: SizedBox(
                    height: 40.sp,
                    width: 40.sp,
                    child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
                  ),
                ),
              ),
            ),
          ),

        // Next Arrow
        if (widget.imageUrls.length > 1)
          Positioned(
            right: 20.w,
            top: 0,
            bottom: 0,
            child: Center(
              child: GestureDetector(
                onTap: _goToNext,
                child: _blurredBackground(
                  child: SizedBox(
                    height: 40.sp,
                    width: 40.sp,
                    child: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
                  ),
                ),
              ),
            ),
          ),

        // Page Indicator
        if (widget.imageUrls.length > 1)
          Positioned(
            bottom: 15.h,
            left: 0,
            right: 0,
            child: Center(
              child: _blurredBackground(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: widget.imageUrls.length,
                    effect: ExpandingDotsEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      activeDotColor: Colors.black,
                      dotColor: Colors.white.withOpacity(0.5),
                      spacing: 8,
                      expansionFactor: 3,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
