import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotel_villa_france/controllers/presentationController.dart';
import 'package:hotel_villa_france/utils/utils.dart';
import 'package:hotel_villa_france/views/screens/home_screen.dart';

class PresentationScreen extends StatelessWidget {
  const PresentationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PresentationController>(
      init: PresentationController(),
      builder: (controller) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    120.verticalSpace,
                    Text(
                      'presentaiontitle',
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ).tr(),
                    22.verticalSpace,
                    Text('presentaiontext',
                            style:
                                TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400))
                        .tr(),
                    // 20.verticalSpace,
                    // Image.asset('assets/images/signature.png'),
                    20.verticalSpace,
                    Text('manager',
                            style:
                                TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400))
                        .tr(),
                    20.verticalSpace,
                    Center(
                        child: Image.asset(
                      'assets/images/hotel.png',
                      width: 335.w,
                      height: 240.h,
                    )),
                    69.verticalSpace,
                    Visibility(
                      visible: controller.firstTime.value, 
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () async {
                                await controller.changeFirstTime();
                                Get.offAll(() => HomeScreen(),
                                    transition: Transition.rightToLeft);
                              },
                              child: Row(
                                children: [
                                  Text('gohome').tr(),
                                  Icon(
                                    Boxicons.bx_right_arrow_alt,
                                    size: 26.sp,
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
              
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
