import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_villa_france/utils/utils.dart';
import 'package:hotel_villa_france/views/widgets/widgets.dart';

class MeetingAndConfScreen extends StatelessWidget {
  const MeetingAndConfScreen({super.key});

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
                    Text(
                  'presentaiontitle',
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ).tr(),
                22.verticalSpace,
                Center(child: Text("meetconftitle",
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),).tr(),),
                22.verticalSpace,
                Image.asset("assets/images/meet.jpg"),
                25.verticalSpace,
                Text('meetconfbody',
                        style:
                            TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400), textAlign: TextAlign.center,)
                    .tr(),
                    22.verticalSpace,
                Image.asset("assets/images/meet_1.jpg"),
                    25.verticalSpace
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}