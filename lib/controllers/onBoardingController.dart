import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hotel_villa_france/views/screens/presentation_screen.dart';

class OnBoardingController extends GetxController {
  PageController pageController = PageController();
  int curIndex = 0;

  next() {
    if (curIndex < 2) {
      pageController.nextPage(
          duration: Duration(milliseconds: 600), curve: Curves.easeInOut);
      curIndex = pageController.page!.toInt();
      update();
    } else {
      Get.offAll(()=>PresentationScreen(), transition: Transition.rightToLeft);
    }
  }

  @override
  void onInit() {
    pageController.addListener(() {
      curIndex = pageController.page!.toInt();
      update();
    });
    super.onInit();
  }
}
