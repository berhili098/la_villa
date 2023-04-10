import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotel_villa_france/utils/colors.dart';
import 'package:hotel_villa_france/utils/utils.dart';
import 'package:hotel_villa_france/views/screens/map_screen.dart';
import 'package:hotel_villa_france/views/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.verticalSpace,
                Text(
                  'contactus',
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
                ).tr(),
                20.verticalSpace,
                Container(
                  width: 335.w,
                  height: 304.h,
                  padding: EdgeInsets.all(13.w),
                  decoration: BoxDecoration(
                      border: Border.all(
                    width: 2.sp,
                  )),
                  child: Container(
                    width: 307.w,
                    height: 278.h,
                    decoration: BoxDecoration(
                        border: Border.all(
                      width: 2.sp,
                    )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'adresse',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ).tr(),
                        15.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'tel',
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ).tr(),
                            Text(
                              '+212 (0)5393331 11',
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        15.verticalSpace,
                        Text(
                          'contact@villadefrance.ma',
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
                10.verticalSpace,
                ElevatedButton(
                  onPressed: () {
                    Get.to(MapScreen(), transition: Transition.rightToLeft);
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(335.w, 55.h),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.r))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Boxicons.bx_navigation),
                      40.horizontalSpace,
                      Text(
                        'getdirection',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ).tr(),
                    ],
                  ),
                ),
                60.verticalSpace,
                Center(
                  child: Text(
                    'stayintouch',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                  ).tr(),
                ),
                36.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () async {
                        String fbLink =
                            "https://www.facebook.com/GrandHotelVillaDeFrance";
                        final String encodedFbURl = Uri.encodeFull(fbLink);
                        if (await launch(encodedFbURl)) {
                          await launch(encodedFbURl);
                        } else {
                          throw 'Could not launch $encodedFbURl';
                        }
                      },
                      icon: Image.asset(
                        'assets/images/fb.png',
                        fit: BoxFit.cover,
                      ),
                      iconSize: 55.w,
                    ),
                    IconButton(
                      onPressed: () async {
                        String tripAdvisorLink =
                            "https://www.tripadvisor.com/Hotel_Review-g293737-d7118909-Reviews-Grand_Hotel_Villa_de_France-Tangier_Tanger_Tetouan_Al_Hoceima.html";
          
                        final String encodedTripAdURl =
                            Uri.encodeFull(tripAdvisorLink);
                        if (await launch(encodedTripAdURl)) {
                          await launch(encodedTripAdURl);
                        } else {
                          throw 'Could not launch $encodedTripAdURl';
                        }
                      },
                      icon: Image.asset(
                        'assets/images/bk.png',
                        fit: BoxFit.cover,
                      ),
                      iconSize: 55.w,
                    ),
                    IconButton(
                      onPressed: () async {
                        String instaLink = "https://www.instagram.com/ghvdf1930/";
                        final String encodedInstaURl = Uri.encodeFull(instaLink);
                        if (await launch(encodedInstaURl)) {
                          await launch(encodedInstaURl);
                        } else {
                          throw 'Could not launch $encodedInstaURl';
                        }
                      },
                      icon: Image.asset(
                        'assets/images/ig.png',
                        fit: BoxFit.cover,
                      ),
                      iconSize: 55.w,
                    )
                  ],
                ),
                15.verticalSpace,
                Center(
                  child: TextButton(
                      child: Text("FAQ", style: TextStyle(color: primaryColor, fontSize: 20.sp)),
                      onPressed: () async {
                        const  faq = "https://hotelv3.medyouin.com/faqs/";
                        if (await launch(faq)) {
                          await launch(faq);
                        } else {
                          throw 'Could not launch $faq';
                        }
                      }),
                ),
                10.verticalSpace,
                Center(child: Text("Copyrights Med You In ${DateTime.now().year}", textAlign: TextAlign.center,),),
                10.verticalSpace
              ],
            ),
          ),
        ),
      ),
    );
  }
}
