// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotel_villa_france/controllers/onBoardingController.dart';
import 'package:hotel_villa_france/utils/buttons.dart';

class OnBoardingWidget extends StatelessWidget {
  String title;
  String body;
  String imagePath;
  OnBoardingWidget(
      {super.key, this.title = '', this.body = '', this.imagePath = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
        ),
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 34.h),
                child: Image.asset('assets/images/logo.png'),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.topLeft,
              height: 168.h,
              margin: EdgeInsets.symmetric(horizontal: 17.w, vertical: 75.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      height: 1.75.h,
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ).tr(),
                  SizedBox(
                    height: 44.h,
                    child: Text(
                      body,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        letterSpacing: 0.7.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ).tr(),
                  ),
                  25.verticalSpace,
                  GetBuilder<OnBoardingController>(
                      init: OnBoardingController(),
                      builder: (controller) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PrimaryButton(
                              text: 'next',
                              onPress: () => controller.next()
                            ),
                          ],
                        );
                      })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
