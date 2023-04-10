import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotel_villa_france/controllers/roomDetailsController.dart';
import 'package:hotel_villa_france/utils/buttons.dart';
import 'package:hotel_villa_france/utils/colors.dart';
import 'package:hotel_villa_france/utils/utils.dart';
import 'package:hotel_villa_france/views/widgets/widgets.dart';

class RoomDetailsScreen extends StatelessWidget {
  const RoomDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      extendBodyBehindAppBar: true,
      body: GetBuilder<RoomDetailsController>(
          init: RoomDetailsController(),
          builder: (controller) {
            return ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 360.h,
                          width: 375.w,
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5.r),
                                  bottomRight: Radius.circular(5.r))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 13.w,
                                vertical: controller.room!.name == "matisse"
                                    ? 20.h
                                    : 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '${controller.room!.name}',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ).tr(),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.start,
                                //   children: [
                                //     Text('from',
                                //             style: TextStyle(
                                //                 fontSize: 14.sp,
                                //                 fontWeight: FontWeight.w500,
                                //                 color: Colors.white))
                                //         .tr(),
                                //     Text(' ${controller.room!.price} ',
                                //         style: TextStyle(
                                //             fontSize: 14.sp,
                                //             fontWeight: FontWeight.w500,
                                //             color: Colors.white)),
                                //     Text('mad',
                                //             style: TextStyle(
                                //                 fontSize: 14.sp,
                                //                 fontWeight: FontWeight.w500,
                                //                 color: Colors.white))
                                //         .tr(),
                                //   ],
                                // ),
                                if (controller.room!.name != "matisse")
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        minimumSize: Size(120.w, 40.h),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.r))),
                                    onPressed: () async {
                                      await controller
                                          .book(controller.room!.bookinLink);
                                    },
                                    child: Text(
                                      "booknow",
                                      style: TextStyle(color: primaryColor),
                                    ).tr(),
                                  )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 375.w,
                          height: 297.h,
                          child: Stack(
                            children: [
                              PageView.builder(
                                controller: controller.pageController,
                                itemBuilder: (context, index) => ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(5.r),
                                      bottomRight: Radius.circular(5.r)),
                                  child: Image.asset(
                                    controller.room!.imagePath![index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                itemCount: controller.room!.imagePath!.length,
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                padding: EdgeInsets.only(bottom: 13.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                      controller.room!.imagePath!.length,
                                      (index) => Container(
                                            height: 10.h,
                                            width: 10.w,
                                            margin:
                                                const EdgeInsets.only(right: 5),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                              color: controller.currentIndex ==
                                                      index
                                                  ? Colors.white
                                                  : Colors.grey[500],
                                            ),
                                          )),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    // 15.verticalSpace,
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 20.w),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text(
                    //         '${controller.room!.name}',
                    //         style: TextStyle(
                    //             fontSize: 20.sp,
                    //             fontWeight: FontWeight.w700,
                    //             color: Colors.black),
                    //       ).tr(),
                    //       Container(
                    //         decoration: BoxDecoration(
                    //             color: primaryColor,
                    //             borderRadius: BorderRadius.circular(50)),
                    //         width: 60.w,
                    //         height: 2.h,
                    //       )
                    //     ],
                    //   ),
                    // ),
                    20.verticalSpace,
                    Table(
                      border: TableBorder(
                          verticalInside: BorderSide(color: Color(0xff54595F))),
                      children: [
                        TableRow(children: [
                          Text(
                            "${controller.room!.infos![0]} m²",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w600),
                          ),
                          Text("${controller.room!.infos![1]} MAX ADULTS",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600)),
                          Text("${controller.room!.infos![2]} MAX CHILDREN",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600)),
                        ])
                      ],
                    ),
                    20.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'details',
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w500),
                          ).tr(),
                          Container(
                            height: 2.5.h,
                            width: 18.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: primaryColor),
                          ),
                          10.verticalSpace,
                          Text(
                            controller.room!.details!,
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w400),
                          ),
                          if (controller.room!.aminities!.isNotEmpty)
                            15.verticalSpace,
                          if (controller.room!.aminities!.isNotEmpty)
                            Text(
                              'aminities',
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w500),
                            ).tr(),
                          if (controller.room!.aminities!.isNotEmpty)
                            Container(
                              height: 2.5.h,
                              width: 18.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: primaryColor),
                            ),
                          10.verticalSpace,
                          Container(
                            width: 375.w,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount:
                                        controller.room!.aminities!.length ~/
                                              2,
                                    itemBuilder: (context, index) {
                                      if (index <
                                          controller.room!.aminities!.length ~/
                                              2) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Get.locale!.languageCode != 'ar'
                                                  ? Boxicons.bx_right_arrow
                                                  : Boxicons.bx_left_arrow,
                                              size: 25.sp,
                                            ),
                                            Text(
                                              controller
                                                  .room!.aminities![index],
                                              style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        );
                                      } else {
                                        return SizedBox.shrink();
                                      }
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            SizedBox(
                                      height: 5.h,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount:
                                        controller.room!.aminities!.length ,
                                    controller: controller.pageController1,
                                    itemBuilder: (context, index) {
                                      if (index >
                                          controller.room!.aminities!.length ~/
                                              2) {
                                        return SizedBox(height: 5.h,);
                                      } else {
                                        return SizedBox.shrink();
                                      }
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                          if (index >
                                          controller.room!.aminities!.length ~/
                                              2) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Get.locale!.languageCode != 'ar'
                                                  ? Boxicons.bx_right_arrow
                                                  : Boxicons.bx_left_arrow,
                                              size: 25.sp,
                                            ),
                                            Text(
                                              controller
                                                  .room!.aminities![index],
                                              style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        );
                                      } else {
                                        return SizedBox.shrink();
                                      }
                                        }
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (controller.room!.services!.isNotEmpty)
                            20.verticalSpace,
                          if (controller.room!.services!.isNotEmpty)
                            Text(
                              'services',
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w500),
                            ).tr(),
                          if (controller.room!.services!.isNotEmpty)
                            Container(
                              height: 2.5.h,
                              width: 18.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: primaryColor),
                            ),
                          15.verticalSpace,
                          ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: controller.room!.services!.length,
                            itemBuilder: (context, index) => Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Get.locale!.languageCode != 'ar'
                                      ? Boxicons.bx_right_arrow
                                      : Boxicons.bx_left_arrow,
                                  size: 25.sp,
                                ),
                                Text(
                                  controller.room!.services![index],
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            separatorBuilder:
                                (BuildContext context, int index) => SizedBox(
                              height: 5.h,
                            ),
                          ),
                          10.verticalSpace
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
