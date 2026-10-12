import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:buynsell/util/constants/sizes.dart';
import 'package:buynsell/util/constants/text_strings_constants.dart';
import 'package:buynsell/util/theme/app_colors.dart';
import 'package:buynsell/util/device/device_utils.dart';

/// Screen displaying user notifications, alerts, and transaction updates.
class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<Map<String, dynamic>> _notifications = [
    {
      'id': 'n1',
      'title': 'New Message from Siddharth',
      'body': 'Can we meet at VT today around 6 PM for Hero Cycle?',
      'time': '5m ago',
      'isRead': false,
      'icon': Iconsax.message,
      'color': AppColors.primary,
    },
    {
      'id': 'n2',
      'title': 'Listing Approved 🎉',
      'body': 'Your listing "Engineering Physics Books" is now visible to all students.',
      'time': '1h ago',
      'isRead': false,
      'icon': Iconsax.verify,
      'color': AppColors.success,
    },
    {
      'id': 'n3',
      'title': 'Price Drop Alert!',
      'body': 'Casio FX-991EX Calculator price dropped to ₹800.',
      'time': 'Yesterday',
      'isRead': true,
      'icon': Iconsax.discount_shape,
      'color': AppColors.warning,
    },
    {
      'id': 'n4',
      'title': 'Meetup Scheduled',
      'body': 'Reminder: Meeting point confirmed at DG Hostel entrance.',
      'time': '2d ago',
      'isRead': true,
      'icon': Iconsax.location,
      'color': AppColors.info,
    },
  ];

  void _markAllAsRead() {
    setState(() {
      for (var item in _notifications) {
        item['isRead'] = true;
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('All notifications marked as read')),
    );
  }

  void _clearAll() {
    setState(() {
      _notifications.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = DeviceUtils().isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(Textconstants.notifications),
        actions: [
          if (_notifications.isNotEmpty)
            PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'mark_read') {
                  _markAllAsRead();
                } else if (value == 'clear_all') {
                  _clearAll();
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'mark_read',
                  child: Text(Textconstants.markAllAsRead),
                ),
                const PopupMenuItem(
                  value: 'clear_all',
                  child: Text('Clear All'),
                ),
              ],
            ),
        ],
      ),
      body: _notifications.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Iconsax.notification,
                    size: 72,
                    color: isDark ? AppColors.unselectedDark : AppColors.unselectedLight,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Text(
                    Textconstants.notificationsEmpty,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              itemCount: _notifications.length,
              separatorBuilder: (_, _) => const SizedBox(height: TSizes.spaceBtwItems),
              itemBuilder: (context, index) {
                final item = _notifications[index];
                final isRead = item['isRead'] as bool;

                return Dismissible(
                  key: Key(item['id']),
                  direction: DismissDirection.endToStart,
                  onDismissed: (_) {
                    setState(() {
                      _notifications.removeAt(index);
                    });
                  },
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: TSizes.md),
                    decoration: BoxDecoration(
                      color: AppColors.error,
                      borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
                    ),
                    child: const Icon(Icons.delete, color: AppColors.white),
                  ),
                  child: Card(
                    elevation: isRead ? 0 : TSizes.cardElevation,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
                      side: BorderSide(
                        color: isRead
                            ? (isDark ? AppColors.darkBorder : AppColors.border)
                            : AppColors.primaryLight.withValues(alpha: 0.5),
                      ),
                    ),
                    color: isRead
                        ? (isDark ? AppColors.darkSurface : AppColors.surface)
                        : (isDark
                            ? AppColors.primaryDark.withValues(alpha: 0.3)
                            : AppColors.primary.withValues(alpha: 0.05)),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(TSizes.sm),
                      leading: CircleAvatar(
                        backgroundColor: (item['color'] as Color).withValues(alpha: 0.15),
                        child: Icon(
                          item['icon'] as IconData,
                          color: item['color'] as Color,
                          size: TSizes.iconMd,
                        ),
                      ),
                      title: Text(
                        item['title'] as String,
                        style: TextStyle(
                          fontWeight: isRead ? FontWeight.w500 : FontWeight.bold,
                          fontSize: TSizes.fontSizeMd,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: TSizes.xs),
                          Text(
                            item['body'] as String,
                            style: const TextStyle(
                              fontSize: TSizes.fontSizeSm,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: TSizes.xs),
                          Text(
                            item['time'] as String,
                            style: TextStyle(
                              fontSize: TSizes.fontSizeXs,
                              color: isDark ? AppColors.unselectedDark : AppColors.unselectedLight,
                            ),
                          ),
                        ],
                      ),
                      trailing: isRead
                          ? null
                          : Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                            ),
                      onTap: () {
                        setState(() {
                          item['isRead'] = true;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
