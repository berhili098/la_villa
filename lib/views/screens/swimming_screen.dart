import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_villa_france/utils/utils.dart';
import 'package:hotel_villa_france/views/widgets/widgets.dart';

class SwimmingScreen extends StatelessWidget {
  const SwimmingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      extendBodyBehindAppBar: true,
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/images/swim.jpg",
                    fit: BoxFit.cover,
                    height: 370.h,
                    colorBlendMode: BlendMode.darken,
                    color: Colors.black.withOpacity(0.4),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "ourswimmingpool",
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: Column(
                  children: [
                    20.verticalSpace,
                    Text(
                      "titlews",
                      style:
                          TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                    ).tr(),
                    20.verticalSpace,
                    Text(
                      "swimbdy",
                      style:
                          TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ).tr(),
                    30.verticalSpace,
                    ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Image.asset("assets/images/swim_${index+1}.jpg", fit: BoxFit.cover,),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10.h,
                            ),
                        itemCount: 3)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
