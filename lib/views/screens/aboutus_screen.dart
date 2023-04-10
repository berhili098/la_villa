import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotel_villa_france/controllers/presentationController.dart';
import 'package:hotel_villa_france/utils/utils.dart';
import 'package:hotel_villa_france/views/widgets/widgets.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PresentationController>(
      init: PresentationController(),
      builder: (controller) {
        return Scaffold(
          appBar: CustomAppBar(),
          extendBodyBehindAppBar: true,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      20.verticalSpace,
                      Text("aboutussecond",  style:
                                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400)).tr(),
                                  20.verticalSpace
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
