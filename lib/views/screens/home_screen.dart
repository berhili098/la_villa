import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotel_villa_france/utils/utils.dart';
import 'package:hotel_villa_france/views/screens/aboutus_screen.dart';
import 'package:hotel_villa_france/views/screens/activities_screen.dart';
import 'package:hotel_villa_france/views/screens/contactus_screen.dart';
import 'package:hotel_villa_france/views/screens/explore_screen.dart';
import 'package:hotel_villa_france/views/screens/gallary_screen.dart';
import 'package:hotel_villa_france/views/screens/meet_conf_screen.dart';
import 'package:hotel_villa_france/views/screens/restaurant_screen.dart';
import 'package:hotel_villa_france/views/screens/rooms_screen.dart';
import 'package:hotel_villa_france/views/screens/swimming_screen.dart';
import 'package:hotel_villa_france/views/widgets/widgets.dart';

import 'presentation_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("oops").tr(),
            // titlePadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            // contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            content: Text("areyousureexit").tr(),
            actions: [
              TextButton(onPressed: () {
                Get.back();
              }, child: Text('cancel').tr()),
              TextButton(
                  onPressed: () {
                    exit(0);
                  },
                  child: Text(
                    'exit',
                    style: TextStyle(color: Colors.red),
                  ).tr()),
            ],
          ),
        );
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    40.verticalSpace,
                    Text(
                      'hometitle',
                      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
                    ).tr(),
                    15.verticalSpace,
                    Text(
                      'homebody',
                      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                    ).tr(),
                    25.verticalSpace,
                    ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        HomeWidget(
                          imagePath: 'assets/images/rooms.png',
                          title: 'ourrooms',
                          onPress: () => Get.to(() => RoomsScreen(),
                              transition: Transition.rightToLeft),
                        ),
                        15.verticalSpace,
                        HomeWidget(
                          imagePath: 'assets/images/restaurant.png',
                          title: 'ourrestaurant',
                          onPress: () => Get.to(() => RestaurantScreen(),
                              transition: Transition.rightToLeft),
                        ),
                        15.verticalSpace,
                        HomeWidget(
                          imagePath: 'assets/images/reception.jpg',
                          title: 'aboutus',
                          hasBlend: true,
                          onPress: () => Get.to(() => AboutUsScreen(),
                              transition: Transition.rightToLeft),
                        ),
                        // 15.verticalSpace,
                        // HomeWidget(
                        //   imagePath: 'assets/images/restaurant.png',
                        //   title: 'ouractivities',
                        //   onPress: () {},
                        // ),
                        15.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             HomeWidget(
                              imagePath: 'assets/images/meet.jpg',
                              title: 'meetconftitle',
                              isExtended: false,
                              hasBlend: true,
                              onPress: () => Get.to(() => MeetingAndConfScreen(),
                                  transition: Transition.rightToLeft),
                            ),
                            HomeWidget(
                              imagePath: 'assets/images/swim.jpg',
                              title: 'swimmingpool',
                              hasBlend: true,
                              isExtended: false,
                              onPress: () => Get.to(() => SwimmingScreen(),
                                  transition: Transition.rightToLeft),
                            ),
                          ],
                        ),
                        15.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            HomeWidget(
                              imagePath: 'assets/images/tangier.png',
                              title: 'ouractivities',
                              isExtended: false,
                              onPress: () => Get.to(() => ExploreScreen(),
                                  transition: Transition.rightToLeft),
                            ),
                            HomeWidget(
                              imagePath: 'assets/images/tangier.png',
                              title: 'ourgallary',
                              isExtended: false,
                              onPress: () => Get.to(() => GallaryScreen(),
                                  transition: Transition.rightToLeft),
                            ),
                          ],
                        ),
                        30.verticalSpace,
                        InkWell(
                          onTap: () => Get.to(() => ContactUsScreen()),
                          child: Center(
                              child: Text(
                            'needhelp',
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w500),
                          ).tr()),
                        ),
                        30.verticalSpace
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
