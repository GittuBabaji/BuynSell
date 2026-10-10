import 'package:buynsell/screens/onboarding/onboarding_controller.dart';
import 'package:buynsell/util/constants/sizes.dart';
import 'package:buynsell/util/helpers/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:buynsell/util/theme/app_colors.dart';
class Onboardingskip extends StatelessWidget {
  const Onboardingskip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TScreenHelper.appBarHeight(),
      right: TSizes.spaceBtwItems,
      child: TextButton(
        onPressed: () {
          OnboardingController.instance.skippage();
        },
        child: const Text(
          "Skip",
style: TextStyle(
  color: AppColors.textSecondary,
  fontSize: 16,
  fontWeight: FontWeight.bold,
  decorationStyle: TextDecorationStyle.solid,
  decorationColor: AppColors.textSecondary,
letterSpacing: 1,
decorationThickness: 2
),
        ),
      ),
    );
  }
}
