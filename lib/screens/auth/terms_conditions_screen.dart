import 'package:flutter/material.dart';
import 'package:buynsell/util/constants/sizes.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Text(
          '''Terms & Conditions for BuyNSell
Last Updated: August 22, 2026

Welcome to BuyNSell.
These Terms and Conditions govern your use of the BuyNSell application and related services.
By creating an account or using BuyNSell, you agree to these Terms.

1. About BuyNSell
BuyNSell is a platform that allows users to create listings, discover products, communicate with other users, and arrange the buying and selling of goods.
BuyNSell acts primarily as a platform connecting users.
Unless explicitly stated otherwise, BuyNSell is not the seller, buyer, owner, manufacturer, or inspector of items listed by users.

2. Eligibility
You must provide accurate information when creating and maintaining your account.
If BuyNSell is intended for the IIT BHU community, access may be restricted to eligible users or verified community members.
You are responsible for ensuring that you are legally eligible to enter into transactions under applicable law.

3. User Accounts
You are responsible for:
Providing accurate account information
Maintaining the confidentiality of your password
Activities performed through your account
Keeping your contact information reasonably up to date

You must not:
Create fake accounts
Impersonate another person
Share or sell your account
Attempt to access another user's account
Circumvent account restrictions or security measures
We may suspend or terminate accounts that violate these Terms.

4. Buying and Selling
Users are responsible for the items they list, buy, or sell.
Sellers must:
Provide accurate descriptions
Use genuine images where appropriate
Clearly disclose major defects or damage
Avoid misleading prices or information
Have the right to sell the item

Buyers are responsible for:
Reviewing listings carefully
Asking relevant questions
Inspecting items when possible
Making independent decisions before completing a transaction

BuyNSell does not guarantee the quality, safety, legality, or authenticity of items listed by users.

5. Direct Transactions and Payments
Currently, payments may be arranged directly between buyers and sellers.
BuyNSell may not process, hold, guarantee, or protect funds involved in these transactions.
Users are responsible for deciding:
How payment will be made
When payment will be made
Where the exchange will occur

 Important
BuyNSell cannot guarantee that every user is trustworthy.
Users should exercise caution when:
Sending money in advance
Meeting another user
Sharing personal information
Purchasing high-value items
Any transaction is primarily an agreement between the buyer and seller.

6. Future Payment Services
BuyNSell may introduce integrated payment functionality in the future.
If this happens:
Additional payment terms may apply.
Third-party payment providers may process transactions.
Additional information may be required for payment processing.
Fees, refunds, disputes, and transaction rules may be introduced.
Users will be informed of applicable terms when such features become available.

7. Prohibited Items
Users must not list, sell, purchase, or promote items or services that are illegal or otherwise prohibited.
This includes, where applicable:
Illegal drugs or controlled substances
Weapons or restricted weapon-related items
Stolen goods
Counterfeit products
Fraudulent documents or identification
Sexually explicit or exploitative content
Items that violate intellectual property rights
Hazardous materials prohibited by law
Any item prohibited under applicable Indian law
BuyNSell may remove listings or suspend accounts for violations.

8. Fraud and Scams
Users must not engage in:
Fake listings
Payment fraud
Phishing
Identity theft
Misrepresentation
Price manipulation
Attempts to deceive or exploit other users

If you suspect fraud, report the user or listing through the available reporting mechanisms or contact BuyNSell support.
We may investigate reports and take actions including:
Removing listings
Restricting accounts
Suspending or terminating users

9. User Communication
BuyNSell may provide messaging features that allow users to communicate.
You must not use these features to:
Harass or threaten others
Send spam
Attempt scams or fraud
Share malicious links or software
Share illegal content
Violate another person's privacy
Messages may be stored as necessary to operate and secure the service.

10. Meeting and Transaction Safety
If buyers and sellers meet in person, they do so at their own discretion and risk.
Users are encouraged to:
Meet in reasonably safe locations
Verify products before completing transactions
Avoid sharing unnecessary personal information
Be cautious when dealing with unknown users
BuyNSell is not responsible for interactions that occur outside the platform, subject to applicable law.

11. User Content
Users retain ownership of content they upload, subject to the rights necessary for BuyNSell to operate the platform.
By uploading content, you grant BuyNSell a non-exclusive, limited right to:
Store the content
Display it to users
Process it for platform functionality
Use it for moderation and security
You are responsible for ensuring that your uploaded content does not violate laws or the rights of others.

12. Account Suspension and Termination
We may suspend, restrict, or terminate your account if we reasonably believe that you:
Violated these Terms
Engaged in fraud
Created fake or misleading listings
Harassed other users
Attempted to compromise the platform
Repeatedly violated marketplace rules
Where appropriate, we may also remove listings or restrict access to certain features.

13. Intellectual Property
The BuyNSell application, branding, design, code, logos, and other platform materials are protected by applicable intellectual property laws.
You may not copy, reproduce, distribute, reverse engineer, or commercially exploit BuyNSell materials without appropriate permission, except where applicable law permits such activity.
Users remain responsible for the content they upload.

14. Disclaimer
BuyNSell provides a platform for users to interact and arrange transactions.
To the maximum extent permitted by applicable law:
Listings are created by users, not BuyNSell.
We do not guarantee product quality or authenticity.
We do not guarantee that users will complete transactions.
We do not guarantee that every listing is accurate.
We do not guarantee that every user is trustworthy.
Use of the platform and transactions with other users are undertaken at your own risk.

15. Limitation of Liability
To the maximum extent permitted by applicable law, BuyNSell and its developers or operators will not be liable for losses arising from:
Transactions between users
Fraud or scams committed by users
Product defects
Incorrect listings
Failed payments arranged outside the platform
Loss or damage resulting from interactions between users
Unauthorized access caused by factors outside reasonable control
Nothing in these Terms limits liability where such limitation is prohibited by applicable law.

16. Changes to These Terms
BuyNSell may update these Terms as the application evolves.
Changes may occur when new features are introduced, including:
Integrated payments
Verification systems
Delivery features
New community rules
The updated Terms will include a revised Last Updated date.

17. Contact
For questions, concerns, reports, or support:
BuyNSell Support
Email: support@buynsell.app''',
          style: TextStyle(fontSize: 14.0, height: 1.5),
        ),
      ),
    );
  }
}
