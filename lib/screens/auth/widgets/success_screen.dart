import "package:buynsell/navigation_menu.dart";
import "package:buynsell/util/constants/asset_constants.dart";
import "package:buynsell/util/constants/sizes.dart";
import "package:buynsell/util/constants/text_strings_constants.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:buynsell/util/helpers/screen_helper.dart";

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace) * 2,
          child: Column(
            children: [
              const SizedBox(height: TSizes.spaceBtwSections * 2), // Top margin
              // Image
              Image(
                image: const AssetImage(TImages.emailVerification), // Can be updated to a success image later
                width: TScreenHelper.screenWidth(context) * 0.6,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Title & SubTitle
              Text(
                Textconstants.yourAccountCreatedTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                Textconstants.yourAccountCreatedSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAll(() => const NavigationMenu());
                  },
                  child: const Text(Textconstants.tContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
