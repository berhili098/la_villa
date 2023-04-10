import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_villa_france/utils/utils.dart';
import 'package:hotel_villa_france/views/widgets/widgets.dart';

class GallaryScreen extends StatelessWidget {
  const GallaryScreen({super.key});

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
                  'ourgallary',
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
                ).tr(),
                15.verticalSpace,
                Text(
                  'gallarybody',
                  style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                ).tr(),
                30.verticalSpace,
                Center(
                  child: Text(
                    'presentaiontitle',
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ).tr(),
                ),
                25.verticalSpace,
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: 31,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 160.w / 130.h,
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.w,
                    mainAxisSpacing: 16.h,
                  ),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => showDialog(builder: (context) => AlertDialog(
                      content: Image.asset('assets/images/gallary/gal_$index.jpg'),
                      contentPadding: EdgeInsets.zero,
                      
                    ), context: context),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.r),
                        child: Image.asset(
                      'assets/images/gallary/gal_$index.jpg',
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
                10.verticalSpace
              ],
            ),
          ),
        ),
      ),
    );
  }
}
