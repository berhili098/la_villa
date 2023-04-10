import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_villa_france/utils/colors.dart';
import 'package:hotel_villa_france/utils/constants.dart';
import 'package:hotel_villa_france/utils/permissions.dart';
import 'package:hotel_villa_france/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await GetStorage.init();
  await handlerPermission();
  Widget? main;
  await initWidget().then((value){
    main = value;
  });
  runApp(EasyLocalization(
      path: 'assets/translations',
      supportedLocales: supportedLocales,
      startLocale: Locale("en"),
      fallbackLocale: Locale('en'),
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => GetMaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.jostTextTheme(
              Theme.of(context).textTheme,
            ),
            colorScheme: ThemeData().colorScheme.copyWith(
                  primary: primaryColor,
                ),
            primaryColor: primaryColor,
          ),
          home: main,
        ),
      )));
}
