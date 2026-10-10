import "package:get/get.dart";
import "package:flutter/material.dart";
import 'package:buynsell/screens/auth/login_screen.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();
  final pageController=PageController();
  Rx<int> currentPageIndex=0.obs;
  void updatePageIndicator(int index) {
    currentPageIndex.value = index;
    
  }
  void dotNavigateclick(int index) {
        currentPageIndex.value = index;
           pageController.jumpToPage(currentPageIndex.value );
    // Handle dot navigation click logic here
  }
  void nextpage(){
    if(currentPageIndex.value==2){
      Get.offAll(() => const LoginScreen());
    }
    else{
      int nextpage=currentPageIndex.value+1;
      currentPageIndex.value=nextpage;
                 pageController.jumpToPage(currentPageIndex.value );

    }
  }
  void skippage(){
          Get.offAll(() => const LoginScreen());

  }

}
