import "package:buynsell/screens/auth/login_screen.dart";
import "package:buynsell/util/constants/asset_constants.dart";
import "package:buynsell/util/constants/sizes.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
class VerifyEmail extends StatelessWidget {
const VerifyEmail({ super.key });
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: (){Get.offAll(()=>const LoginScreen());},
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child:Padding(
          padding:EdgeInsets.all(TSizes.defaultSpace),
          child:Column(
            children:[
              Image(image: AssetImage(TImages.emailVerification),)

            ]
          )
        ),
      )
    );
  }
}
