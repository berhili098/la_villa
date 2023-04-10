import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_villa_france/controllers/onBoardingController.dart';
import 'package:hotel_villa_france/utils/utils.dart';
import 'package:hotel_villa_france/views/widgets/onboarding_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<OnBoardingController>(
            init: OnBoardingController(),
            builder: (controller) {
              return ScrollConfiguration(
                 behavior: MyBehavior(),
                child: PageView(
                  controller: controller.pageController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    OnBoardingWidget(
                      title: 'onboarding1title',
                      body:
                          'onboarding1body',
                      imagePath: 'assets/images/onb_1.png',
                    ),
                    OnBoardingWidget(
                     title: 'onboarding2title',
                      body:
                          'onboarding2body',
                      imagePath: 'assets/images/onb_2.png',
                    ),
                    OnBoardingWidget(
                      title: 'onboarding3title',
                      body:
                          'onboarding3body',
                      imagePath: 'assets/images/onb_3.png',
                    )
                  ],
                ),
              );
            }));
  }
}
