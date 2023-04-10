import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_villa_france/utils/buttons.dart';
import 'package:hotel_villa_france/utils/colors.dart';
import 'package:hotel_villa_france/utils/menu.dart';
import 'package:hotel_villa_france/utils/utils.dart';
import 'package:hotel_villa_france/views/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.verticalSpace,
                    Text(
                      'ourmenu',
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w700),
                    ).tr(),
                    15.verticalSpace,
                    Text(
                      'menusubtitle',
                      style: TextStyle(
                          fontSize: 13.sp, fontWeight: FontWeight.w500),
                    ).tr(),
                    16.verticalSpace,
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                color: primaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("delacroix",
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        )).tr(),
                    Container(
                      height: 2.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r)),
                    ),
                    6.verticalSpace,
                    Text('menubody',
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                height: 2.sp))
                        .tr(),
                    15.verticalSpace,
                    Text("songdetangier",
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                height: 2.sp))
                        .tr(),
                    Container(
                      height: 2.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r)),
                    ),
                    6.verticalSpace,
                    Text('songdetangierbody',
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                height: 2.sp))
                        .tr(),
                    10.verticalSpace,
                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            launch('tel: +212-5393-33111');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                              minimumSize: Size(270.w, 45.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.r))),
                          child: Text("reservenow", style: TextStyle(color: primaryColor, fontSize: 15.sp, fontWeight: FontWeight.w600),).tr()),
                    ),
                    10.verticalSpace
                  ],
                ),
              ),
              7.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'pastrychefspecialities',
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w700),
                    ).tr(),
                    Container(
                      width: 18.w,
                      height: 2.5.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: primaryColor),
                    ),
                    16.verticalSpace,
                    ListView.separated(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: pastrychefspecialities.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (index == 5)
                              Icon(
                                Boxicons.bxs_star,
                                color: primaryColor,
                              ),
                            Container(
                              width: 230.w,
                              padding:
                                  EdgeInsets.only(left: index == 5 ? 4.w : 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(pastrychefspecialities[index].title!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          pastrychefspecialities[index].subtitle!,
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w400),
                        ).tr(),
                        trailing: Text(
                          '${pastrychefspecialities[index].price.toString()} MAD',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        height: 10.h,
                      ),
                    ),
                    20.verticalSpace,
                    Text(
                      'starterspecialities',
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w700),
                    ).tr(),
                    Container(
                      width: 18.w,
                      height: 2.5.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: primaryColor),
                    ),
                    16.verticalSpace,
                    ListView.separated(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: starterspecialities.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (index == 5)
                              Icon(
                                Boxicons.bxs_star,
                                color: primaryColor,
                              ),
                            Container(
                              width: 230.w,
                              padding:
                                  EdgeInsets.only(left: index == 5 ? 4.w : 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(starterspecialities[index].title!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          starterspecialities[index].subtitle!,
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w400),
                        ).tr(),
                        trailing: Text(
                          '${starterspecialities[index].price.toString()} MAD',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        height: 10.h,
                      ),
                    ),
                    20.verticalSpace,
                    Text(
                      'fishspecialitie',
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w700),
                    ).tr(),
                    Container(
                      width: 18.w,
                      height: 2.5.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: primaryColor),
                    ),
                    16.verticalSpace,
                    ListView.separated(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: fishspecialitie.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (index == 2)
                              Icon(
                                Boxicons.bxs_star,
                                color: primaryColor,
                              ),
                            Container(
                              width: 230.w,
                              padding:
                                  EdgeInsets.only(left: index == 2 ? 4.w : 0),
                              child: Column(
                                children: [
                                  Text(
                                    fishspecialitie[index].title!,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          fishspecialitie[index].subtitle!,
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w400),
                        ).tr(),
                        trailing: Text(
                          '${fishspecialitie[index].price.toString()} MAD',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        height: 10.h,
                      ),
                    ),
                    20.verticalSpace,
                    Text(
                      'mealspecialitie',
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w700),
                    ).tr(),
                    Container(
                      width: 18.w,
                      height: 2.5.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: primaryColor),
                    ),
                    16.verticalSpace,
                    ListView.separated(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: mealspecialitie.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (index == 2)
                              Icon(
                                Boxicons.bxs_star,
                                color: primaryColor,
                              ),
                            Container(
                              width: 230.w,
                              padding:
                                  EdgeInsets.only(left: index == 2 ? 4.w : 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(mealspecialitie[index].title!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          mealspecialitie[index].subtitle!,
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w400),
                        ).tr(),
                        trailing: Text(
                          '${mealspecialitie[index].price.toString()} MAD',
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        height: 10.h,
                      ),
                    ),
                    15.verticalSpace,
                    Text(
                      'restaugallary',
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.w700),
                    ).tr(),
                    Container(
                      width: 18.w,
                      height: 2.5.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: primaryColor),
                    ),
                    10.verticalSpace,
                    Text("restaugallarytext").tr(),
                    15.verticalSpace,
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.w),
                      itemBuilder: (context, index) => ClipRRect(
                        borderRadius: BorderRadius.circular(5.r),
                        child: Image.asset(
                          "assets/images/restaurent/rest_$index.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    15.verticalSpace
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
