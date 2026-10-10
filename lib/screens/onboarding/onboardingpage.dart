import 'package:buynsell/util/constants/sizes.dart';
import 'package:buynsell/util/helpers/screen_helper.dart';
import 'package:flutter/material.dart';

class Onboardingpage extends StatelessWidget {
  const Onboardingpage({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });
  final String title, description, imagePath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          //image
          Image(
            width: TScreenHelper.percentWidth(context, 80),
            height: TScreenHelper.percentHeight(context, 60),
            image: AssetImage(imagePath),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          //text
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
