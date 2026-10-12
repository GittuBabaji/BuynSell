import 'package:flutter/material.dart';
import 'package:buynsell/util/constants/sizes.dart';
import 'package:buynsell/util/constants/text_strings_constants.dart';
import 'package:buynsell/util/theme/app_colors.dart';

/// Displays the "Create Account" title and subtitle at the top of the register screen.
class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Textconstants.createAccount,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: TSizes.sm),
        Text(
          Textconstants.registerSubTitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
        ),
      ],
    );
  }
}
