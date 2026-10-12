import 'package:buynsell/screens/auth/widgets/verify_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:buynsell/util/constants/text_strings_constants.dart';
import 'package:buynsell/util/constants/sizes.dart';
import 'package:buynsell/util/theme/app_colors.dart';
import 'package:buynsell/routes/app_routes.dart';
import 'package:get/get.dart';

/// The registration form with all input fields, validation, and action buttons.
class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _hostelController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _hostelController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(Textconstants.acceptTerms)),
      );
      return;
    }
    
    if (_formKey.currentState?.validate() ?? false) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text(Textconstants.processingRegistration),),
      // );
      Get.to(()=>const VerifyEmail());
      // TODO: Implement actual registration logic using AuthService / Firebase Auth
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Full Name
          TextFormField(
            controller: _nameController,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              labelText: Textconstants.fullNameLabel,
              prefixIcon: Icon(Icons.person_outline),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return Textconstants.enterFullName;
              }
              return null;
            },
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Institute Email
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: Textconstants.instituteEmailLabel,
              hintText: Textconstants.instituteEmailHint,
              prefixIcon: Icon(Icons.email_outlined),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return Textconstants.enterEmail;
              }
              if (!value.contains('@')) {
                return Textconstants.validEmail;
              }
              if (!(value.endsWith("@itbhu.ac.in") || value.endsWith("@iitbhu.ac.in"))) {
                return Textconstants.validEmailex;
              }
              // Check for malicious payload (only allow standard email chars)
              final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@(itbhu\.ac\.in|iitbhu\.ac\.in)$');
              if (!emailRegex.hasMatch(value.trim())) {
                return Textconstants.maliciousPayloadError;
              }
              return null;
            },
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Phone Number
          TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: Textconstants.phoneLabel,
              prefixIcon: Icon(Icons.phone_outlined),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return Textconstants.enterPhone;
              }
              final phoneClean = value.trim().replaceAll(RegExp(r'[\s-]'), '');
              if (!RegExp(r'^[0-9]{10}$').hasMatch(phoneClean)) {
                return Textconstants.validPhone;
              }
              return null;
            },
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Hostel / Residence
          TextFormField(
            controller: _hostelController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              labelText: Textconstants.hostelLabel,
              hintText: Textconstants.hostelHint,
              prefixIcon: Icon(Icons.location_city_outlined),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return Textconstants.enterHostel;
              }
              return null;
            },
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Password
          TextFormField(
            controller: _passwordController,
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              labelText: Textconstants.passwordLabel,
              prefixIcon: const Icon(Icons.lock_outline),
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return Textconstants.enterPassword;
              }
              if (value.length < 6) {
                return Textconstants.passwordMinLength;
              }
              return null;
            },
          ),
          const SizedBox(height: TSizes.spaceBtwItems),

          // Terms and Conditions Checkbox
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: TSizes.checkboxSize,
                height: TSizes.checkboxSize,
                child: Checkbox(
                  value: _agreeToTerms,
                  onChanged: (value) {
                    setState(() {
                      _agreeToTerms = value ?? false;
                    });
                  },
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodySmall,
                    children: [
                      const TextSpan(text: Textconstants.agreeTo),
                      TextSpan(
                        text: Textconstants.termsOfUse,
                        style: TextStyle(
                          color: AppColors.primary,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, AppRoutes.termsConditions);
                          },
                      ),
                      const TextSpan(text: Textconstants.and),
                      TextSpan(
                        text: Textconstants.privacyPolicy,
                        style: TextStyle(
                          color: AppColors.primary,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, AppRoutes.privacyPolicy);
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          // Register Button
          ElevatedButton(
            onPressed: _handleRegister,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: TSizes.md),
            ),
            child: const Text(
              Textconstants.registerButton,
              style: TextStyle(fontSize: TSizes.fontSizeLg),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),

          // Already have an account? Login
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(Textconstants.alreadyHaveAccount),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(Textconstants.loginButton),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
