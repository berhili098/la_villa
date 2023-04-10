import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hotel_villa_france/views/screens/home_screen.dart';
import 'package:hotel_villa_france/views/screens/onboarding_screen.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

Future<Widget> initWidget() async {
  final isFirstTime = await GetStorage().read('isFirstTime');
  if (isFirstTime == false) {
    return HomeScreen();
  } else {
    return OnboardingScreen();
  }
}
