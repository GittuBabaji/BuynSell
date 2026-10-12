import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:buynsell/screens/notifications/notifications_screen.dart';
import 'package:buynsell/screens/products/search_screen.dart';
import 'package:buynsell/screens/products/product_details_screen.dart';
import 'package:buynsell/screens/home/categories_screen.dart';
import 'package:buynsell/util/constants/sizes.dart';
import 'package:buynsell/util/constants/text_strings_constants.dart';
import 'package:buynsell/util/theme/app_colors.dart';
import 'package:buynsell/util/device/device_utils.dart';

/// Main Home Dashboard for the Buy N Sell IIT BHU app.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategoryFilter = 'All';

  final List<Map<String, dynamic>> _featuredCategories = const [
    {'name': 'All', 'icon': Iconsax.grid_5},
    {'name': 'Bicycles', 'icon': Icons.directions_bike_outlined},
    {'name': 'Books', 'icon': Icons.menu_book_outlined},
    {'name': 'Electronics', 'icon': Icons.devices_outlined},
    {'name': 'Mattresses', 'icon': Icons.bed_outlined},
    {'name': 'Sports', 'icon': Icons.sports_tennis_outlined},
  ];

  final List<Map<String, String>> _allListings = const [
    {
      'id': 'p1',
      'title': 'Hero Cycle 21-Speed',
      'price': '₹ 3,500',
      'originalPrice': '₹ 5,000',
      'hostel': 'Limbdi Hostel • Room 112',
      'sellerName': 'Aman Verma',
      'category': 'Bicycles',
      'condition': 'Used - Good',
      'description':
          'Hero Sprint Pro 21-speed cycle. Front suspension, dual disc brakes. Perfect for campus commuting from Limbdi to Department.',
    },
    {
      'id': 'p2',
      'title': 'Engineering Physics Books Set',
      'price': '₹ 800',
      'originalPrice': '₹ 1,500',
      'hostel': 'Rajputana Hostel • Room 45',
      'sellerName': 'Priyanshu Singh',
      'category': 'Books',
      'condition': 'Like New',
      'description':
          'Complete 1st year engineering physics textbook and reference guides. Clean pages with minimal highlighting.',
    },
    {
      'id': 'p3',
      'title': 'Single Bed Foam Mattress',
      'price': '₹ 1,200',
      'originalPrice': '₹ 2,400',
      'hostel': 'DG Hostel • Room 204',
      'sellerName': 'Rahul Sharma',
      'category': 'Mattresses',
      'condition': 'Used - Good',
      'description':
          'High-density foam mattress, standard hostel cot size (6x3 ft). Used for 1 academic year, thoroughly cleaned.',
    },
    {
      'id': 'p4',
      'title': 'Casio FX-991EX Calculator',
      'price': '₹ 950',
      'originalPrice': '₹ 1,400',
      'hostel': 'Morvi Hostel • Room 30',
      'sellerName': 'Siddharth Rao',
      'category': 'Electronics',
      'condition': 'Excellent',
      'description':
          'Genuine Casio ClassWiz scientific calculator. Perfect for semester exams, quizzes, and engineering labs.',
    },
    {
      'id': 'p5',
      'title': 'Study Table LED Lamp (Rechargeable)',
      'price': '₹ 450',
      'originalPrice': '₹ 899',
      'hostel': 'Gargi Hostel • Room 118',
      'sellerName': 'Ananya Patel',
      'category': 'Electronics',
      'condition': 'Like New',
      'description':
          '3-level dimmable warm/white LED desk lamp with 2000mAh battery. Great for late night studying without disturbing roommates.',
    },
    {
      'id': 'p6',
      'title': 'Yonex Nanoray Badminton Racket',
      'price': '₹ 1,100',
      'originalPrice': '₹ 1,800',
      'hostel': 'Vishveshvarya Hostel • Room 82',
      'sellerName': 'Kunal Mishra',
      'category': 'Sports',
      'condition': 'Good',
      'description':
          'Lightweight carbon graphite racket with full cover. Newly strung with BG-65 strings at Gymkhana.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = DeviceUtils().isDarkMode(context);

    final filteredListings = _selectedCategoryFilter == 'All'
        ? _allListings
        : _allListings
            .where((item) => item['category'] == _selectedCategoryFilter)
            .toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              Textconstants.homebartitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: TSizes.fontSizeXl,
              ),
            ),
            SizedBox(height: TSizes.xs),
            Row(
              children: [
                Icon(Icons.location_on, size: TSizes.iconXs, color: AppColors.white),
                SizedBox(width: TSizes.xs),
                Text(
                  Textconstants.campusLocation,
                  style: TextStyle(
                    fontSize: TSizes.fontSizeSm,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Iconsax.notification),
                onPressed: () {
                  Get.to(() => const NotificationsScreen());
                },
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.error,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: TSizes.xs),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar Card (tappable -> navigates to SearchScreen)
              GestureDetector(
                onTap: () {
                  Get.to(() => const SearchScreen());
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: TSizes.md,
                    vertical: TSizes.md,
                  ),
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.darkSurface : AppColors.surface,
                    borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
                    border: Border.all(
                      color: isDark ? AppColors.darkBorder : AppColors.border,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withValues(alpha: isDark ? 0.2 : 0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(Iconsax.search_normal, color: AppColors.textSecondary),
                      const SizedBox(width: TSizes.md),
                      const Expanded(
                        child: Text(
                          Textconstants.searchHint,
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: TSizes.fontSizeMd,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(TSizes.xs),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
                        ),
                        child: const Icon(
                          Iconsax.filter,
                          size: TSizes.iconSm,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Featured Categories Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Textconstants.featuredCategories,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const CategoriesScreen());
                    },
                    child: const Text(Textconstants.viewAll),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Category Horizontal Filter Pills
              SizedBox(
                height: 44,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _featuredCategories.length,
                  separatorBuilder: (_, _) => const SizedBox(width: TSizes.sm),
                  itemBuilder: (context, index) {
                    final cat = _featuredCategories[index];
                    final isSelected = cat['name'] == _selectedCategoryFilter;

                    return ChoiceChip(
                      selected: isSelected,
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            cat['icon'] as IconData,
                            size: TSizes.iconSm,
                            color: isSelected
                                ? AppColors.white
                                : (isDark ? AppColors.unselectedDark : AppColors.unselectedLight),
                          ),
                          const SizedBox(width: TSizes.xs),
                          Text(cat['name'] as String),
                        ],
                      ),
                      selectedColor: AppColors.primary,
                      backgroundColor: isDark ? AppColors.darkSurface : AppColors.surface,
                      labelStyle: TextStyle(
                        color: isSelected
                            ? AppColors.white
                            : (isDark ? AppColors.white : AppColors.textPrimary),
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                        fontSize: TSizes.fontSizeSm,
                      ),
                      onSelected: (selected) {
                        setState(() {
                          _selectedCategoryFilter = cat['name'] as String;
                        });
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Recent Listings Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Textconstants.recentListings,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '${filteredListings.length} items',
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: TSizes.fontSizeSm,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Product Listings (Tappable -> opens ProductDetailsScreen)
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredListings.length,
                separatorBuilder: (_, _) => const SizedBox(height: TSizes.spaceBtwItems),
                itemBuilder: (context, index) {
                  final item = filteredListings[index];

                  return Card(
                    elevation: TSizes.cardElevation,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
                      side: BorderSide(
                        color: isDark ? AppColors.darkBorder : AppColors.border,
                      ),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
                      onTap: () {
                        // Open ProductDetailsScreen with product parameters
                        Get.to(
                          () => ProductDetailsScreen(
                            productId: item['id']!,
                            title: item['title'],
                            price: item['price'],
                            originalPrice: item['originalPrice'],
                            hostel: item['hostel'],
                            sellerName: item['sellerName'],
                            category: item['category'],
                            condition: item['condition'],
                            description: item['description'],
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(TSizes.md),
                        child: Row(
                          children: [
                            // Product Icon / Thumbnail box
                            Container(
                              width: 68,
                              height: 68,
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
                              ),
                              child: const Icon(
                                Iconsax.box,
                                size: TSizes.iconLg,
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(width: TSizes.md),

                            // Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['title']!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: TSizes.fontSizeMd,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: TSizes.xs),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        size: TSizes.iconXs,
                                        color: AppColors.textSecondary,
                                      ),
                                      const SizedBox(width: TSizes.xs),
                                      Expanded(
                                        child: Text(
                                          item['hostel']!,
                                          style: const TextStyle(
                                            color: AppColors.textSecondary,
                                            fontSize: TSizes.fontSizeSm,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: TSizes.xs),
                                  Row(
                                    children: [
                                      Text(
                                        item['price']!,
                                        style: const TextStyle(
                                          color: AppColors.success,
                                          fontWeight: FontWeight.bold,
                                          fontSize: TSizes.fontSizeLg,
                                        ),
                                      ),
                                      const SizedBox(width: TSizes.sm),
                                      Text(
                                        item['originalPrice']!,
                                        style: const TextStyle(
                                          color: AppColors.textSecondary,
                                          decoration: TextDecoration.lineThrough,
                                          fontSize: TSizes.fontSizeSm,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // Arrow forward
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: TSizes.iconXs,
                              color: AppColors.textSecondary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
