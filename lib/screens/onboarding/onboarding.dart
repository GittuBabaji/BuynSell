import 'package:buynsell/screens/onboarding/onboarding_next.dart';
import 'package:buynsell/screens/onboarding/onboardingdotnav.dart';
import 'package:buynsell/screens/onboarding/onboardingpage.dart';
import 'package:buynsell/screens/onboarding/onboarding_controller.dart';
import 'package:buynsell/screens/onboarding/onboardingskip.dart';
import "package:flutter/material.dart";
import "package:buynsell/util/constants/asset_constants.dart";
import 'package:buynsell/util/constants/text_strings_constants.dart';
import "package:get/get.dart";
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController=Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          //Scrollable pages
          PageView(
            controller:pageController.pageController,
            onPageChanged: pageController.updatePageIndicator,
            children: [
              Onboardingpage(
                title: Textconstants.onboardingtitle1,
                description: Textconstants.onboardingdesc1,
                imagePath: TImages.onboarding1,
              ),
              Onboardingpage(
                title: Textconstants.onboardingtitle2,
                description: Textconstants.onboardingdesc2,
                imagePath: TImages.onboarding2,
              ),
              Onboardingpage(
                title: Textconstants.onboardingtitle3,
                description: Textconstants.onboardingdesc3,
                imagePath: TImages.onboarding3,
              ),
            ],
          ),
          //skip
          Onboardingskip(),
          //dot nav
          Onboardingdotnav(),
          //circ
          OnboardingNext()
        ],
      ),
    );
  }
}
