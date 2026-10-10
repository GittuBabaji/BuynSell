import 'package:buynsell/screens/onboarding/onboarding_controller.dart';
import 'package:buynsell/util/constants/sizes.dart';
import 'package:buynsell/util/helpers/screen_helper.dart';
import 'package:buynsell/util/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboardingdotnav extends StatelessWidget {
  const Onboardingdotnav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isdark=Theme.of(context).brightness==Brightness.dark;
      final col=isdark ? AppColors.primarywidgetlight:AppColors.primarywidgetdark;
      final controller=OnboardingController.instance;
    return Positioned(
      bottom:TScreenHelper.bottomSafeArea(context)+25,
      left:TSizes.defaultSpace,

      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigateclick,
      effect:ExpandingDotsEffect(activeDotColor:col,dotHeight:6),
      count: 3)
      );
  }
}
