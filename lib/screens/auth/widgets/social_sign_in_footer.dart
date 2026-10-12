import 'package:flutter/material.dart';
import 'package:buynsell/util/constants/asset_constants.dart';
import 'package:buynsell/util/constants/text_strings_constants.dart';
import 'package:buynsell/util/constants/sizes.dart';
import 'package:buynsell/util/device/device_utils.dart';
import 'package:buynsell/util/theme/app_colors.dart';

/// Displays the "Or Sign In With" divider and Google sign-in button.
/// Reusable across login and register screens.
class SocialSignInFooter extends StatelessWidget {
  const SocialSignInFooter({super.key});

  void _handleGoogleSignIn(BuildContext context) {
    // TODO: Implement Google Sign-In using google_sign_in + firebase_auth
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text(Textconstants.googleSignInComingSoon)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = DeviceUtils().isDarkMode(context);
    return Column(
      children: [
        // --- "Or Sign In With" Divider ---
        Row(
          children: [
            Expanded(
              child: Divider(
                color: isDark ? AppColors.darkDivider : AppColors.divider,
                thickness: TSizes.dividerHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
              child: Text(
                Textconstants.orSignInWith,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            Expanded(
              child: Divider(
                color: isDark ? AppColors.darkDivider : AppColors.divider,
                thickness: TSizes.dividerHeight,
              ),
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        // --- Google Sign-In Button ---
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () => _handleGoogleSignIn(context),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: TSizes.md),
              side: BorderSide(
                color: isDark ? AppColors.darkBorder : AppColors.border,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(TSizes.buttonRadius),
              ),
            ),
            icon: Image.asset(
              TIcons.googleIcon,
              height: TSizes.iconMd,
              width: TSizes.iconMd,
            ),
            label: const Text(
              Textconstants.signInWithGoogle,
              style: TextStyle(fontSize: TSizes.fontSizeLg),
            ),
          ),
        ),
      ],
    );
  }
}
