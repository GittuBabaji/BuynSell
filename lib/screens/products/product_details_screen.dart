import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:buynsell/screens/chat/conversations_screen.dart';
import 'package:buynsell/util/constants/sizes.dart';
import 'package:buynsell/util/constants/text_strings_constants.dart';
import 'package:buynsell/util/theme/app_colors.dart';
import 'package:buynsell/util/device/device_utils.dart';

/// Screen displaying detailed information for a specific product identified by [productId].
class ProductDetailsScreen extends StatefulWidget {
  final String productId;
  final String? title;
  final String? price;
  final String? originalPrice;
  final String? hostel;
  final String? sellerName;
  final String? description;
  final String? condition;
  final String? category;
  final String? imageUrl;

  const ProductDetailsScreen({
    super.key,
    required this.productId,
    this.title,
    this.price,
    this.originalPrice,
    this.hostel,
    this.sellerName,
    this.description,
    this.condition,
    this.category,
    this.imageUrl,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool _isWishlisted = false;

  @override
  Widget build(BuildContext context) {
    final isDark = DeviceUtils().isDarkMode(context);

    final displayTitle = widget.title ?? 'Campus Item';
    final displayPrice = widget.price ?? '₹ 1,000';
    final displayOriginalPrice = widget.originalPrice ?? '';
    final displayHostel = widget.hostel ?? 'Limbdi Hostel • IIT BHU';
    final displaySeller = widget.sellerName ?? 'IIT BHU Student';
    final displayCondition = widget.condition ?? 'Used - Good';
    final displayCategory = widget.category ?? 'General';
    final displayDescription = widget.description ??
        'Available for direct pickup on campus. Inspected and maintained in good working condition. Meetup available near hostel or VT.';

    return Scaffold(
      appBar: AppBar(
        title: const Text(Textconstants.productDetails),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Sharing $displayTitle link...')),
              );
            },
          ),
          IconButton(
            icon: Icon(
              _isWishlisted ? Icons.favorite : Icons.favorite_border,
              color: _isWishlisted ? AppColors.error : null,
            ),
            onPressed: () {
              setState(() {
                _isWishlisted = !_isWishlisted;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    _isWishlisted ? 'Added to Wishlist' : 'Removed from Wishlist',
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Images Carousel / Header Banner
            Container(
              height: 260,
              width: double.infinity,
              color: isDark ? AppColors.darkSurface : AppColors.divider,
              child: Stack(
                children: [
                  Center(
                    child: Icon(
                      Iconsax.box,
                      size: 80,
                      color: isDark ? AppColors.unselectedDark : AppColors.unselectedLight,
                    ),
                  ),
                  Positioned(
                    bottom: TSizes.sm,
                    right: TSizes.md,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm,
                        vertical: TSizes.xs,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.black.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
                      ),
                      child: Text(
                        displayCategory,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: TSizes.fontSizeSm,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            // Product Title and Price Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    displayTitle,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: TSizes.sm),
                  Row(
                    children: [
                      Text(
                        displayPrice,
                        style: const TextStyle(
                          fontSize: TSizes.fontSizeXxl,
                          fontWeight: FontWeight.bold,
                          color: AppColors.success,
                        ),
                      ),
                      if (displayOriginalPrice.isNotEmpty) ...[
                        const SizedBox(width: TSizes.sm),
                        Text(
                          displayOriginalPrice,
                          style: const TextStyle(
                            fontSize: TSizes.fontSizeLg,
                            color: AppColors.textSecondary,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                      const Spacer(),
                      Chip(
                        label: Text(
                          displayCondition,
                          style: const TextStyle(fontSize: TSizes.fontSizeSm),
                        ),
                        backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                        side: BorderSide.none,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),
            const Divider(height: TSizes.spaceBtwSections),

            // Description Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Textconstants.description,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: TSizes.sm),
                  Text(
                    displayDescription,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          height: 1.5,
                        ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),
            const Divider(height: TSizes.spaceBtwSections),

            // Seller Info Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Card(
                elevation: TSizes.cardElevation,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.md),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: AppColors.primary.withValues(alpha: 0.15),
                        child: const Icon(Icons.person, color: AppColors.primary),
                      ),
                      const SizedBox(width: TSizes.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              displaySeller,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: TSizes.fontSizeLg,
                              ),
                            ),
                            const SizedBox(height: TSizes.xs),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  size: TSizes.iconSm,
                                  color: AppColors.textSecondary,
                                ),
                                const SizedBox(width: TSizes.xs),
                                Expanded(
                                  child: Text(
                                    displayHostel,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections * 1.5),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.md),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    Get.to(() => const ConversationsScreen());
                  },
                  icon: const Icon(Icons.chat_bubble_outline),
                  label: const Text(Textconstants.chatWithSeller),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: TSizes.md),
                  ),
                ),
              ),
              const SizedBox(width: TSizes.md),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (ctx) => Padding(
                        padding: const EdgeInsets.all(TSizes.defaultSpace),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Buy $displayTitle',
                              style: Theme.of(ctx).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: TSizes.sm),
                            Text('Agreed Price: $displayPrice'),
                            Text('Pickup Location: $displayHostel'),
                            const SizedBox(height: TSizes.spaceBtwSections),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(ctx);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Order request sent to $displaySeller!'),
                                    ),
                                  );
                                },
                                child: const Text('Confirm Purchase'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.shopping_bag_outlined),
                  label: const Text(Textconstants.buyNow),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: TSizes.md),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
