import 'package:flutter/material.dart';
import 'package:buynsell/util/constants/asset_constants.dart';
import 'package:buynsell/util/constants/text_strings_constants.dart';
import 'package:buynsell/util/constants/sizes.dart';
import 'package:buynsell/util/device/device_utils.dart';

/// Displays the app logo, login title, and subtitle at the top of the login screen.
class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = DeviceUtils().isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // --- Logo ---
        Image(
          height: TSizes.logoHeight,
          image: AssetImage(isDark ? TIcons.lightLogo : TIcons.darkLogo),
        ),

        // --- Title & Subtitle ---
        Text(
          Textconstants.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: TSizes.sm),
        Text(
          Textconstants.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
