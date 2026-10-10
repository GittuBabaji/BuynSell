import 'package:buynsell/screens/onboarding/onboarding_controller.dart';
import 'package:buynsell/util/constants/sizes.dart';
import 'package:buynsell/util/helpers/screen_helper.dart';
import 'package:buynsell/util/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnboardingNext extends StatelessWidget {
  const OnboardingNext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
        final isdark=Theme.of(context).brightness==Brightness.dark;
      final col=isdark ? AppColors.primarywidgetlight:AppColors.primarywidgetdark;
    return Positioned(
      right:TSizes.defaultSpace,
      bottom: TScreenHelper.bottomSafeArea(context)+25,
      child:ElevatedButton(
        onPressed: (){OnboardingController.instance.nextpage();},
        style:ElevatedButton.styleFrom(
          backgroundColor: col,
          shape: const CircleBorder(),
        ),
         child: const Icon(Iconsax.arrow_right_3)
         )
    );
  }
}
