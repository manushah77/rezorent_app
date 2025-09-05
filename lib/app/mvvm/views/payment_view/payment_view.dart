import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rezorent_app/app/config/app_assets.dart';
import 'package:rezorent_app/app/config/app_colors.dart';
import 'package:rezorent_app/app/config/app_text_style.dart';
import 'package:rezorent_app/app/config/padding_extensions.dart';
import 'package:rezorent_app/app/custom_widgets/app_custom_button.dart';
import 'package:rezorent_app/app/custom_widgets/app_custom_field.dart';
import 'package:rezorent_app/app/custom_widgets/custom_back_button.dart';
import 'package:rezorent_app/app/custom_widgets/sizedbox_extension.dart';
import 'package:rezorent_app/app/mvvm/view_model/payment_controller/payment_controller.dart';

import '../../../config/utils.dart';
import '../../../custom_widgets/custom_pickers/date_picker_dialog.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  final PaymentController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.sp), bottomRight: Radius.circular(20.sp)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.h.height,
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [CustomBackButton(isWhite: false)]),
                5.h.height,
                Text(
                  'Payment',
                  style: AppTextStyles.customText24(color: Colors.black, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Smart checkout',
                  style: AppTextStyles.customText14(color: Color(0xff777E90), fontWeight: FontWeight.w500),
                ),
                10.h.height,
              ],
            ).paddingLeft(15.w),
          ),
          Expanded(
            child: SafeArea(
              top: false,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(12.sp)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(AppAssets.securePaymentIcon, height: 50.h),
                          10.w.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Secure Payment',
                                style: AppTextStyles.customText18(color: Colors.white, fontWeight: FontWeight.w600),
                              ),
                              3.h.height,
                              SizedBox(
                                width: 250.w,
                                child: Text(
                                  'Your payment information is protected with bank-level security',
                                  style: AppTextStyles.customText14(color: Colors.white, fontWeight: FontWeight.w400, height: 1),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ).paddingFromAll(8.sp),
                    ),
                    10.h.height,
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.sp)),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Payment Method',
                              style: AppTextStyles.customText18(color: Colors.black, fontWeight: FontWeight.w600),
                            ),
                          ),
                          10.h.height,
                          Obx(() {
                            return _buildPaymentMethodWidget(
                              iconPath: AppAssets.creditCardIcon,
                              title: "Credit/Debit Card",
                              val: 'credit',
                              selectedVal: controller.paymentMethod.value,
                              onTap: () {
                                controller.paymentMethod.value = 'credit';
                              },
                            );
                          }),
                          10.h.height,
                          Obx(() {
                            return _buildPaymentMethodWidget(
                              iconPath: AppAssets.cashAtArrivalIcon,
                              title: "Cash at Arrival",
                              val: 'cash',
                              selectedVal: controller.paymentMethod.value,
                              onTap: () {
                                controller.paymentMethod.value = 'cash';
                              },
                            );
                          }),
                        ],
                      ).paddingFromAll(13.sp),
                    ),
                    10.h.height,
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.sp)),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Card Information',
                              style: AppTextStyles.customText18(color: Colors.black, fontWeight: FontWeight.w600),
                            ),
                          ),
                          8.h.height,
                          AppCustomField(
                            labelTitle: "Card Number",
                            enabledBorder: 8.sp,
                            disabledBorder: 8.sp,
                            labelColor: Colors.black,
                            labelFontWeight: FontWeight.w600,
                            enabledBorderColor: Color(0xffD9D9D9),
                            focusedBorder: 8.sp,
                            focusedBorderColor: AppColors.primary,
                            hintText: 'Enter Card Number',
                            hintTextFontSize: 16,
                            fillColor: Colors.transparent,
                          ),
                          7.h.height,
                          Row(
                            children: [
                              Expanded(
                                child: AppCustomField(
                                  titleWidget: SizedBox.shrink(),
                                  enabledBorder: 8.sp,
                                  disabledBorder: 8.sp,
                                  isReadOnly: true,
                                  labelTitle: 'Expiry Date',
                                  labelFontWeight: FontWeight.w600,
                                  labelColor: Colors.black,
                                  enabledBorderColor: Color(0xffD9D9D9),
                                  focusedBorder: 8.sp,
                                  focusedBorderColor: AppColors.primary,
                                  hintText: 'MM/YY',
                                  hintTextFontSize: 16,
                                  fillColor: Colors.transparent,
                                  onTap: () async {
                                    Utils.formatDateDMY(await ShowDatePicker(context));
                                  },
                                ),
                              ),
                              10.w.width,
                              Expanded(
                                child: AppCustomField(
                                  titleWidget: SizedBox.shrink(),
                                  enabledBorder: 8.sp,
                                  disabledBorder: 8.sp,
                                  labelTitle: 'CVV',
                                  labelFontWeight: FontWeight.w600,
                                  labelColor: Colors.black,
                                  enabledBorderColor: Color(0xffD9D9D9),
                                  focusedBorder: 8.sp,
                                  focusedBorderColor: AppColors.primary,
                                  hintText: 'Enter CVV',
                                  hintTextFontSize: 16,
                                  fillColor: Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                          8.h.height,
                          AppCustomField(
                            labelTitle: "Cardholder Name",
                            enabledBorder: 8.sp,
                            disabledBorder: 8.sp,
                            labelColor: Colors.black,
                            labelFontWeight: FontWeight.w600,
                            enabledBorderColor: Color(0xffD9D9D9),
                            focusedBorder: 8.sp,
                            focusedBorderColor: AppColors.primary,
                            hintText: 'Enter name',
                            textInputAction: TextInputAction.done,
                            hintTextFontSize: 16,
                            fillColor: Colors.transparent,
                          ),
                        ],
                      ).paddingFromAll(12.sp),
                    ),
                    10.h.height,
                    Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.sp)),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Final Summary',
                              style: AppTextStyles.customText16(color: Colors.black, fontWeight: FontWeight.w600),
                            ),
                          ),
                          8.h.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(AppAssets.checkIconPng, height: 40.h),
                              8.w.width,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Paradise Beach Resort',
                                    style: AppTextStyles.customText14(color: Colors.black, fontWeight: FontWeight.w500),
                                  ),
                                  Text('Dec 25, 2024 • 2guests • 09:00 AM', style: AppTextStyles.customText12(color: AppColors.textLightBlack)),
                                ],
                              ),
                            ],
                          ),
                          10.h.height,
                          DottedLine(dashColor: AppColors.textLightBlack.withOpacity(0.6), dashLength: 3, dashGapLength: 2),
                          10.h.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Subtotal',
                                style: AppTextStyles.customText16(color: AppColors.textLightBlack, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '7000',
                                style: AppTextStyles.customText16(color: AppColors.black, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Service fee',
                                style: AppTextStyles.customText16(color: AppColors.textLightBlack, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '350',
                                style: AppTextStyles.customText16(color: AppColors.black, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Taxes & fees',
                                style: AppTextStyles.customText16(color: AppColors.textLightBlack, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '650',
                                style: AppTextStyles.customText16(color: AppColors.black, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          10.h.height,
                          DottedLine(dashColor: AppColors.textLightBlack.withOpacity(0.6), dashLength: 3, dashGapLength: 2),
                          10.h.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: AppTextStyles.customText16(color: AppColors.black, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '8000',
                                style: AppTextStyles.customText16(color: AppColors.black, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ).paddingFromAll(10.sp),
                    ),
                    10.h.height,
                    AppCustomButton(title: "Pay 8,000", onPressed: () {}).paddingHorizontal(15.w),
                    15.h.height,
                  ],
                ),
              ).paddingHorizontal(15.w).paddingTop(10.h),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodWidget({
    required String iconPath,
    required String title,
    required String val,
    required String selectedVal,
    required VoidCallback onTap,
  }) {
    bool isSelected = val == selectedVal;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.transparent,
          borderRadius: BorderRadius.circular(8.sp),
          border: Border.all(color: Colors.black.withOpacity(0.1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 60.w,
                  child: Image.asset(iconPath, height: 30.h),
                ),
                Text(
                  title,
                  style: AppTextStyles.customText16(color: Colors.black, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Container(
              height: 15.sp,
              width: 15.sp,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.transparent,
                border: Border.all(color: isSelected ? AppColors.primary : Color(0xff777E90)),
              ),
              child: isSelected
                  ? Container(
                      decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.primary),
                    ).paddingFromAll(1.sp)
                  : null,
            ),
          ],
        ).paddingVertical(13.h).paddingRight(10.w),
      ),
    );
  }
}
