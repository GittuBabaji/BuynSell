import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:buynsell/screens/auth/login_screen.dart';
import 'package:buynsell/util/constants/asset_constants.dart';
import 'package:buynsell/util/constants/sizes.dart';
import 'package:buynsell/util/constants/text_strings_constants.dart';
import 'package:buynsell/util/helpers/screen_helper.dart';

/// Screen displayed after a password reset email has been sent.
class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, this.email = ''});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.clear),
            onPressed: () => Get.offAll(() => const LoginScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Image / Illustration
              Image(
                image: const AssetImage(TImages.emailVerification),
                width: TScreenHelper.screenWidth(context) * 0.6,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Recipient Email (if provided)
              if (email.isNotEmpty) ...[
                Text(
                  email,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
              ],

              // Title
              Text(
                Textconstants.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Subtitle
              Text(
                Textconstants.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Done Button -> navigates back to Login
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: TSizes.md),
                  ),
                  child: const Text(Textconstants.done),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Resend Email Button
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    // TODO: Implement actual resend password reset email logic with AuthService
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(Textconstants.passwordResetEmailSent),
                      ),
                    );
                  },
                  child: const Text(Textconstants.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Alias for ResetPasswordScreen
typedef PasswordResetEmailSentScreen = ResetPasswordScreen;
