import 'package:flutter/material.dart';
import 'package:buynsell/util/theme/spacing_styles.dart';
import 'package:buynsell/util/constants/sizes.dart';
import 'package:buynsell/screens/auth/widgets/login_header.dart';
import 'package:buynsell/screens/auth/widgets/login_form.dart';
import 'package:buynsell/screens/auth/widgets/social_sign_in_footer.dart';

/// Main login screen — composes [LoginHeader], [LoginForm], and [SocialSignInFooter].
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TspacingStyle.paddingwithAppbarheight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              LoginHeader(),
              SizedBox(height: TSizes.spaceBtwSections),
              LoginForm(),
              SizedBox(height: TSizes.spaceBtwSections),
              SocialSignInFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
