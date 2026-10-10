import 'package:flutter/material.dart';
import 'package:buynsell/util/constants/text_strings_constants.dart';
import 'package:buynsell/util/constants/sizes.dart';
import 'package:buynsell/screens/auth/widgets/register_header.dart';
import 'package:buynsell/screens/auth/widgets/register_form.dart';
import 'package:buynsell/screens/auth/widgets/social_sign_in_footer.dart';

/// Main register screen — composes [RegisterHeader] and [RegisterForm].
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Textconstants.registerButton),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                RegisterHeader(),
                SizedBox(height: TSizes.spaceBtwSections),
                RegisterForm(),
                SizedBox(height: TSizes.spaceBtwSections),
                SocialSignInFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
