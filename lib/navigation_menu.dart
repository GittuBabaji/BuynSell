import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:buynsell/screens/home/home_screen.dart';
import 'package:buynsell/screens/buyer/wishlist_screen.dart';
import 'package:buynsell/screens/seller/upload_product_screen.dart';
import 'package:buynsell/screens/chat/conversations_screen.dart';
import 'package:buynsell/screens/profile/profile_screen.dart';
import 'package:buynsell/util/constants/sizes.dart';
import 'package:buynsell/util/constants/text_strings_constants.dart';
import 'package:buynsell/util/device/device_utils.dart';
import 'package:buynsell/util/theme/app_colors.dart';

/// Root navigation container with a responsive bottom navigation bar
/// supporting both light and dark themes.
class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final isDark = DeviceUtils().isDarkMode(context);

    final selectedItemColor = isDark ? AppColors.white : AppColors.primary;
    final unselectedItemColor = isDark ? AppColors.unselectedDark : AppColors.unselectedLight;

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: TSizes.navigationBarHeight,
          elevation: isDark ? 0 : TSizes.cardElevation,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: isDark ? AppColors.darkSurface : AppColors.surface,
          indicatorColor: isDark
              ? AppColors.primaryLight.withValues(alpha: 0.25)
              : AppColors.primary.withValues(alpha: 0.12),
          destinations: [
            NavigationDestination(
              icon: Icon(Iconsax.home, color: unselectedItemColor),
              selectedIcon: Icon(Iconsax.home, color: selectedItemColor),
              label: Textconstants.navHome,
            ),
            NavigationDestination(
              icon: Icon(Iconsax.heart, color: unselectedItemColor),
              selectedIcon: Icon(Iconsax.heart, color: selectedItemColor),
              label: Textconstants.navWishlist,
            ),
            NavigationDestination(
              icon: Icon(Iconsax.add_circle, color: unselectedItemColor),
              selectedIcon: Icon(Iconsax.add_circle, color: selectedItemColor),
              label: Textconstants.navSell,
            ),
            NavigationDestination(
              icon: Icon(Iconsax.message, color: unselectedItemColor),
              selectedIcon: Icon(Iconsax.message, color: selectedItemColor),
              label: Textconstants.navChat,
            ),
            NavigationDestination(
              icon: Icon(Iconsax.user, color: unselectedItemColor),
              selectedIcon: Icon(Iconsax.user, color: selectedItemColor),
              label: Textconstants.navProfile,
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

/// State controller managing active tab in [NavigationMenu].
class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = const [
    HomeScreen(),
    WishlistScreen(),
    UploadProductScreen(),
    ConversationsScreen(),
    ProfileScreen(),
  ];
}
