import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_villa_france/views/widgets/widgets.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            width: 375.w,
            height: 450.h,
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/tang.jpg",
                  fit: BoxFit.cover,
                  height: 370.h,
                  colorBlendMode: BlendMode.darken,
                  color: Colors.black.withOpacity(0.3),
                ),
                Container(
                  width: 375.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "exptanger",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w900),
                      ).tr(),
                      15.verticalSpace,
                      Text(
                        "exptanger",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w900),
                      ).tr(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
