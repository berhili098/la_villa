// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  String text;
  VoidCallback? onPress;
  PrimaryButton({
    Key? key,
    this.onPress,
    this.text = ''
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPress!();
      },
      style: ElevatedButton.styleFrom(
          minimumSize: Size(335.w, 55.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r))),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
        ),
      ).tr(),
    );
  }
}