import 'package:flutter/material.dart';
import 'package:buynsell/util/constants/sizes.dart';
import 'package:buynsell/util/constants/text_strings_constants.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Textconstants.privacyPolicy),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Text(
          '''Privacy Policy for BuyNSell
Last Updated: August 22, 2026

Welcome to BuyNSell. BuyNSell is a marketplace platform designed to help members of the IIT BHU community buy, sell, and connect with other users.
This Privacy Policy explains what information we collect, how we use it, and the choices you have regarding your information.
By using BuyNSell, you agree to the practices described in this Privacy Policy.

1. Information We Collect
We may collect the following types of information:

Account Information
When you create an account, we may collect:
Name
Email address
Phone number
Profile picture
IIT BHU or other relevant community information

Authentication information
You may sign in using:
Email and password
Google Sign-In

Product and Listing Information
When you create a listing, we may collect and store:
Product title
Description
Price
Product category
Product images
Product condition
Location or pickup information
Other information you choose to include in your listing

Messages and Communications
When users communicate through the BuyNSell chat feature, messages and related information may be stored to provide and operate the messaging service.

Usage and Technical Information
We may automatically collect certain technical information, such as:
Device information
App usage information
Log information
Crash reports
Authentication and security-related information

2. How We Use Your Information
We may use your information to:
Create and manage your account
Authenticate users
Display and manage product listings
Enable communication between buyers and sellers
Improve the app and its features
Maintain security and prevent fraud or abuse
Respond to support requests
Enforce our Terms and Conditions
Comply with applicable legal requirements

3. Firebase and Third-Party Services
BuyNSell may use services provided by Firebase to operate parts of the application.
These services may include:
Firebase Authentication
Cloud Firestore
Firebase Storage
Firebase Cloud Messaging
Analytics or crash reporting services, if enabled in the future

Google Sign-In may also be used to authenticate users.
Information processed by these services may be handled according to their respective privacy policies and terms.

4. How Your Information Is Shared
Certain information you provide may be visible to other users.
For example, depending on how the app is designed:
Your name or profile information may be visible.
Product listings may be publicly visible to other BuyNSell users.
Product images and descriptions may be visible.
Information you voluntarily share in chats may be visible to the person you communicate with.

We do not intend to sell your personal information to advertisers.
We may disclose information when reasonably necessary to:
Protect users or the platform
Prevent fraud or illegal activity
Enforce our Terms and Conditions
Respond to valid legal requests
Protect the rights, safety, or property of BuyNSell and its users

5. Product Images and User Content
Users are responsible for the content they upload, including:
Product images
Descriptions
Profile pictures
Messages
By uploading content to BuyNSell, you grant us a limited right to store, process, display, and transmit that content as necessary to operate the platform.
You must not upload content that:
Violates another person's privacy or intellectual property rights
Is illegal or fraudulent
Contains harmful or malicious material
Is sexually explicit or abusive
Misrepresents a product or service

6. Payments and Transactions
At present, BuyNSell may allow buyers and sellers to arrange payments directly with each other.
BuyNSell is currently not necessarily involved in the actual transfer of money between users.
Therefore, users are responsible for:
Verifying the identity of the other party
Inspecting products where appropriate
Agreeing on payment methods
Completing transactions safely
BuyNSell is not responsible for losses arising from direct transactions between users, except where liability cannot legally be excluded.
In the future, BuyNSell may introduce integrated payment processing. If that happens, this Privacy Policy may be updated to explain how payment information is collected and processed.

7. Data Storage and Security
We use reasonable technical and organizational measures to protect user information.
Data may be stored using cloud services such as Firebase and related infrastructure.
However, no method of internet transmission or electronic storage is completely secure. Therefore, we cannot guarantee absolute security of your information.
Users should also protect their accounts by:
Using a secure password
Not sharing login credentials
Logging out from shared devices
Being cautious when communicating with other users

8. Data Retention
We may retain your information for as long as necessary to:
Operate your account
Provide BuyNSell services
Resolve disputes
Maintain security
Comply with legal obligations
Some information may remain in backups or logs for a limited period after deletion.

9. Your Choices and Account Deletion
You may have the ability to:
Update your account information
Remove or edit product listings
Manage certain information associated with your account
Request deletion of your account and associated personal information
To request account or data deletion, contact us at:
support@buynsell.app

Some information may be retained where necessary for security, fraud prevention, dispute resolution, backups, or legal compliance.

10. Children's Privacy
BuyNSell is not intended for users who are not legally eligible to use the service under applicable law.
If we learn that we have collected personal information in violation of applicable requirements, we may take appropriate steps to delete or restrict that information.

11. Changes to This Privacy Policy
We may update this Privacy Policy as BuyNSell evolves.
For example, updates may be required when we introduce:
In-app payments
New authentication methods
New communication features
Additional data collection
New third-party services
The updated policy will include a revised Last Updated date.
Continued use of BuyNSell after changes take effect may constitute acceptance of the updated Privacy Policy, where permitted by law.

12. Contact Us
If you have questions about this Privacy Policy or your data, contact:
BuyNSell Support
Email: support@buynsell.app''',
          style: TextStyle(fontSize: TSizes.fontSizeMd, height: 1.5),
        ),
      ),
    );
  }
}
