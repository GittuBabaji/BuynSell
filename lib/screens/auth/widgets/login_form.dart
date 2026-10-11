import 'package:flutter/material.dart';
import 'package:buynsell/screens/auth/forgot_password_screen.dart';
import 'package:buynsell/util/constants/text_strings_constants.dart';
import 'package:buynsell/util/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

/// The login form containing email, password, remember me, forgot password, and action buttons.
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _rememberMe = false;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: Implement actual login logic using AuthService / Firebase Auth
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(Textconstants.processingLogin)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Email Field
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: Textconstants.emailLabel,
              prefixIcon: Icon(Iconsax.direct_right),
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

          // Password Field
          TextFormField(
            controller: _passwordController,
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              labelText: Textconstants.passwordLabel,
              prefixIcon: const Icon(Iconsax.password_check),
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Iconsax.eye : Iconsax.eye_slash,
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
          const SizedBox(height: TSizes.spaceBtwInputFields / 2),

          // Remember Me & Forgot Password Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Remember Me
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
                  ),
                  const Text(Textconstants.rememberMe),
                ],
              ),
              // Forgot Password
              TextButton(
                onPressed: () {
                  Get.to(() => const ForgotPasswordScreen());
                },
                child: const Text(Textconstants.forgotPassword),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          // Login Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _handleLogin,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: TSizes.md),
              ),
              child: const Text(Textconstants.loginButton),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),

          // Create Account Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                // TODO: Navigate to RegisterScreen
                Navigator.pushNamed(context, '/register');
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: TSizes.md),
              ),
              child: const Text(Textconstants.registerButton),
            ),
          ),
        ],
      ),
    );
  }
}
