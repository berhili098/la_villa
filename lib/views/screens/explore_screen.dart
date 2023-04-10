import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_villa_france/utils/plcaes_list.dart';
import 'package:hotel_villa_france/utils/utils.dart';
import 'package:hotel_villa_france/views/widgets/widgets.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      extendBodyBehindAppBar: true,
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/images/tang.jpg",
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
                          "exptanger",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w900),
                        ).tr(),
                        15.verticalSpace,
                        Text(
                          "exptangersub",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w900),
                        ).tr(),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    40.verticalSpace,
                    Text(
                      "exptangerbody",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.75.sp),
                    ).tr(),
                    Container(
                        width: 375.w,
                        child: Image.asset('assets/images/hotel.png')),
                    15.verticalSpace,
                    Text("What to See and Do"),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20.r)
                      ),
                      height: 1.2.h,
                      width: 100.w,
                    ),
                    10.verticalSpace,
                    Text(
                        "You can easily spend a few days in Tangier without getting bored. There are a lot of cultural, historical and colorful sites to visit."),
                        20.verticalSpace,
                    Text(
                        "Here’s an overview of things to do and places to visit in the city. You can easily tackle all the places in one day."),
                    ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => ListTile(
                          contentPadding: EdgeInsets.zero,
                              title: Text(
                                "${index + 1}. ${places[index].title!.toUpperCase()}",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              subtitle: Text(places[index].description!),
                            ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 15.h),
                        itemCount: places.length),
                    10.verticalSpace,
                    Container(height: 250.h, width: 375.w,child: Image.asset('assets/images/Tanger_cor.jpg', fit: BoxFit.cover,),),
                    5.verticalSpace,
                    Center(child: Text('Walk through the beach - Tangier')),
                    25.verticalSpace,
                    Container(height:250.h,width: 375.w, child: Image.asset('assets/images/parc-perdicaris.jpg', fit: BoxFit.cover,)),
                    5.verticalSpace,
                    Center(child: Text('Rmilat Park - Tangier')),
                    25.verticalSpace,
                    Container(height:250.h,width: 375.w, child: Image.asset('assets/images/bar_1.jpg', fit: BoxFit.cover,)),
                    5.verticalSpace,
                    Center(child: Text('Grand Hotel Villa De France - Bar')),
                    25.verticalSpace,
                    Container(height:250.h,width: 375.w, child: Image.asset('assets/images/bar_2.jpg', fit: BoxFit.cover,)),
                    5.verticalSpace,
                    Center(child: Text('Grand Hotel Villa De France - Bar')),
                    10.verticalSpace
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
