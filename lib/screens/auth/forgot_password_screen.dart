import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:buynsell/screens/auth/reset_password_screen.dart';
import 'package:buynsell/util/constants/sizes.dart';
import 'package:buynsell/util/constants/text_strings_constants.dart';

/// Screen where users enter their institute email to request a password reset link.
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text.trim();
      Get.to(() => ResetPasswordScreen(email: email));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Headings
              Text(
                Textconstants.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                Textconstants.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections * 2),

              // Form with Email Field
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: Textconstants.emailLabel,
                    prefixIcon: Icon(Iconsax.direct_right),
                  ),
                  validator: (value) {
                    final email = value?.trim() ?? "";
                    if (email.isEmpty) {
                      return Textconstants.enterEmail;
                    }
                    if (!RegExp(
                      r'^[a-zA-Z0-9._%+-]+@(itbhu\.ac\.in|iitbhu\.ac\.in)$',
                    ).hasMatch(email)) {
                      return Textconstants.validEmailex;
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handleSubmit,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: TSizes.md),
                  ),
                  child: const Text(Textconstants.submit),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Alias for ForgotPasswordScreen
typedef ForgetPasswordScreen = ForgotPasswordScreen;
