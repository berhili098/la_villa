import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotel_villa_france/controllers/formController.dart';
import 'package:hotel_villa_france/utils/buttons.dart';
import 'package:hotel_villa_france/utils/utils.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class HomeWidget extends StatelessWidget {
  String? title, imagePath;
  bool isExtended;
  VoidCallback? onPress;
  bool? hasBlend;
  HomeWidget(
      {Key? key,
      this.title,
      this.imagePath,
      this.isExtended = true,
      this.hasBlend = false,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress!();
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: hasBlend!
                    ? ColorFilter.mode(
                        Colors.black.withOpacity(0.4), BlendMode.darken)
                    : null,
                image: AssetImage(
                  imagePath!,
                ),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(5.r)),
        height: 115.h,
        width: isExtended ? 335.w : 163.w,
        child: Center(
          child: Text(
            title!,
            style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
                fontWeight: FontWeight.w900),
          ).tr(),
        ),
      ),
    );
  }
}

class RoomWidget extends StatelessWidget {
  String? name;
  String? price;
  String? imagePath;
  VoidCallback? onPress;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RoomWidget(
      {Key? key,
      this.name,
      this.price,
      this.imagePath,
      this.onPress,
      required this.scaffoldKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress!();
      },
      child: Container(
        height: 125.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            image: DecorationImage(
                image: AssetImage(imagePath!), fit: BoxFit.cover)),
        child: Row(
          mainAxisAlignment: name != "matisse"
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: name != "matisse"
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              crossAxisAlignment: name != "matisse"
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                Text(
                  name!,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ).tr(),
                if (name != "matisse")
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('from',
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white))
                          .tr(),
                      Text(' $price  ',
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                      // Text('mad',
                      //         style: TextStyle(
                      //             fontSize: 10.sp,
                      //             fontWeight: FontWeight.w400,
                      //             color: Colors.white))
                      //     .tr(),
                    ],
                  )
              ],
            ),
            if (name != "matisse")
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("reservefrom").tr(),
                      content: GetBuilder<FormController>(
                          init: FormController(),
                          builder: (controller) {
                            return ScrollConfiguration(
                              behavior: MyBehavior(),
                              child: SingleChildScrollView(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("reservefrombody").tr(),
                                      15.verticalSpace,
                                      if(controller.isEmpty)
                                      Container(
                                        width: 375.w,
                                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.red.withOpacity(0.6),
                                              borderRadius:
                                                  BorderRadius.circular(5.r)), child: Text("Please fill all required inputs", style: TextStyle(color: Colors.red, fontSize: 14.sp),),),
                                      if(controller.isEmpty)
                                      10.verticalSpace,
                                      PrimaryTextField(
                                        text: "Firstname",
                                        controller:
                                            controller.firstNameController,
                                      ),
                                      10.verticalSpace,
                                      PrimaryTextField(
                                        text: "Lastname",
                                        controller:
                                            controller.lastNameController,
                                      ),
                                      10.verticalSpace,
                                      if(controller.emailBool)
                                      Container(
                                        width: 375.w,
                                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.red.withOpacity(0.6),
                                              borderRadius:
                                                  BorderRadius.circular(5.r)), child: Text("Please correct email field", style: TextStyle(color: Colors.red, fontSize: 14.sp),),),
                                      if(controller.emailBool)
                                      10.verticalSpace,
                                      PrimaryTextField(
                                        text: "Email",
                                        controller: controller.emailController,
                                      ),
                                      10.verticalSpace,
                                      if(controller.phoneBool)
                                      Container(
                                        width: 375.w,
                                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.red.withOpacity(0.6),
                                              borderRadius:
                                                  BorderRadius.circular(5.r)), child: Text("Please correct phone field", style: TextStyle(color: Colors.red, fontSize: 14.sp),),),
                                      if(controller.phoneBool)
                                      10.verticalSpace,
                                      Container(
                                        height: 45.h,
                                        child: InternationalPhoneNumberInput(
                                          initialValue: PhoneNumber(
                                            isoCode: "MA",
                                          ),
                                          spaceBetweenSelectorAndTextField: 0,
                                          inputDecoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 5.h,
                                                      horizontal: 10.w),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.r)),
                                              hintText: "Phone number"),
                                          onInputChanged: (PhoneNumber number) {
                                            controller.prefix = number.dialCode!;
                                            controller.update();
                                          },
                                          onInputValidated: (bool value) {
                                            print(value);
                                          },
                                          selectorConfig: SelectorConfig(
                                            selectorType: PhoneInputSelectorType
                                                .BOTTOM_SHEET,
                                          ),
                                          ignoreBlank: false,
                                          autoValidateMode:
                                              AutovalidateMode.disabled,
                                          selectorTextStyle:
                                              TextStyle(color: Colors.black),
                                          textFieldController:
                                              controller.phoneController,
                                          formatInput: false,
                                          keyboardType:
                                              TextInputType.numberWithOptions(
                                                  signed: true, decimal: true),
                                          inputBorder: OutlineInputBorder(),
                                          onSaved: (PhoneNumber number) {
                                            print('On Saved: $number');
                                          },
                                        ),
                                      ),
                                      10.verticalSpace,
                                      Text("Note ( Optional )"),
                                      10.verticalSpace,
                                      NoteTextField(
                                        text: "Note ( Optional )",
                                        controller: controller.noteController,
                                      ),
                                      20.verticalSpace,
                                      PrimaryButton(
                                        text: "Submit",
                                        onPress: () {
                                          controller.sendEmail(name, context);
                                        },
                                      ),
                                      5.verticalSpace
                                    ]),
                              ),
                            );
                          }),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    maximumSize: Size(120.w, 30.h),
                    minimumSize: Size(120.w, 30.h),
                    side: BorderSide(color: Colors.white),
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r))),
                child: Text("reservenow").tr(),
              )
          ],
        ),
      ),
    );
  }
}

class PrimaryTextField extends StatelessWidget {
  String text;
  TextEditingController controller;
  PrimaryTextField({
    required this.text,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
            hintText: text,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.r))),
      ),
    );
  }
}

class NoteTextField extends StatelessWidget {
  String text;
  TextEditingController controller;
  NoteTextField({
    required this.text,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        maxLines: 7,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
            hintText: text,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.r))),
      ),
    );
  }
}

PreferredSize CustomAppBar() {
  return PreferredSize(
      preferredSize: Size(375.w, 60.h),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Get.locale!.languageCode == 'ar'
                  ? Boxicons.bx_right_arrow_alt
                  : Boxicons.bx_left_arrow_alt,
              color: Colors.black,
              size: 30.sp,
            )),
      ));
}
