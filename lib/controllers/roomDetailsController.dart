// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hotel_villa_france/utils/models/room.dart';
import 'package:url_launcher/url_launcher.dart';

class RoomDetailsController extends GetxController {
  Room? room;
  int currentIndex = 0;
  PageController pageController = PageController();
  ScrollController pageController1 = ScrollController(initialScrollOffset: 15, keepScrollOffset: true,);

  book(url) async {
    if (await launch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
  }

  @override
  void onInit() {
    room = Get.arguments[0];
    pageController.addListener(() {
      currentIndex = pageController.page!.toInt();
      update();
    });
    super.onInit();
  }
}
