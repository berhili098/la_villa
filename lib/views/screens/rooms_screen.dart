import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotel_villa_france/utils/rooms_list.dart';
import 'package:hotel_villa_france/utils/utils.dart';
import 'package:hotel_villa_france/views/screens/room_details_screen.dart';
import 'package:hotel_villa_france/views/widgets/widgets.dart';

class RoomsScreen extends StatelessWidget {
  RoomsScreen({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
                  'ourrooms',
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
                ).tr(),
                15.verticalSpace,
                Text(
                  'roomsbody',
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                ).tr(),
                25.verticalSpace,
                // making productions data -> training -> Model -> serve predictions
                ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => RoomWidget(
                          scaffoldKey: scaffoldKey,
                          name: roomsList[index].name,
                          price: roomsList[index].price,
                          imagePath: roomsList[index].profileImage,
                          onPress: () => Get.to(() => RoomDetailsScreen(),
                              transition: Transition.rightToLeft,
                              arguments: [roomsList[index]]),
                        ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 20.h),
                    itemCount: roomsList.length)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
