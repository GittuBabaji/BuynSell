import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:buynsell/navigation_menu.dart';
import 'package:buynsell/util/constants/sizes.dart';
import 'package:buynsell/util/constants/text_strings_constants.dart';
import 'package:buynsell/util/theme/app_colors.dart';
import 'package:buynsell/screens/auth/widgets/login_header.dart';
import 'package:buynsell/screens/auth/widgets/login_form.dart';
import 'package:buynsell/screens/auth/widgets/social_sign_in_footer.dart';

/// Main login screen — composes [LoginHeader], [LoginForm], and [SocialSignInFooter].
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () => Get.offAll(() => const NavigationMenu()),
            child: const Text(
              Textconstants.skip,
              style: TextStyle(
                fontSize: TSizes.fontSizeLg,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: TSizes.defaultSpace,
            right: TSizes.defaultSpace,
            bottom: TSizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LoginHeader(),
              const SizedBox(height: TSizes.spaceBtwSections),
              const LoginForm(),
              const SizedBox(height: TSizes.spaceBtwSections),
              const SocialSignInFooter(),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextButton(
                onPressed: () => Get.offAll(() => const NavigationMenu()),
                child: const Text(Textconstants.skipToHome),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
