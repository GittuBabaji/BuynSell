import 'package:flutter/material.dart';

/// Screen listing all product categories in Buy N Sell IIT BHU.
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  // TODO: Replace sample static categories with backend/provider data loading logic
  final List<Map<String, dynamic>> _allCategories = const [
    {
      'name': 'Books & Notes',
      'icon': Icons.menu_book,
      'itemCount': '120+ items',
    },
    {
      'name': 'Electronics & Gadgets',
      'icon': Icons.devices,
      'itemCount': '85+ items',
    },
    {
      'name': 'Bicycles & Transport',
      'icon': Icons.directions_bike,
      'itemCount': '45+ items',
    },
    {
      'name': 'Mattresses & Bedding',
      'icon': Icons.bed,
      'itemCount': '30+ items',
    },
    {
      'name': 'Lab Equipment & Tools',
      'icon': Icons.science,
      'itemCount': '25+ items',
    },
    {
      'name': 'Room Essentials & Furniture',
      'icon': Icons.chair,
      'itemCount': '60+ items',
    },
    {
      'name': 'Sports & Fitness',
      'icon': Icons.sports_basketball,
      'itemCount': '40+ items',
    },
    {
      'name': 'Clothing & Accessories',
      'icon': Icons.checkroom,
      'itemCount': '50+ items',
    },
    {
      'name': 'Others',
      'icon': Icons.more_horiz,
      'itemCount': '15+ items',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Categories'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Browse by Category',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Find items listed across all IIT BHU hostels',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
              const SizedBox(height: 16),

              // Categories Grid
              // TODO: Fetch all product categories dynamically from API/Provider
              Expanded(
                child: GridView.builder(
                  itemCount: _allCategories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.2,
                  ),
                  itemBuilder: (context, index) {
                    final category = _allCategories[index];
                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: InkWell(
                        onTap: () {
                          // TODO: Navigate to category products list screen
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundColor: Theme.of(context)
                                    .primaryColor
                                    .withValues(alpha: 0.1),
                                child: Icon(
                                  category['icon'] as IconData,
                                  color: Theme.of(context).primaryColor,
                                  size: 28,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                category['name'] as String,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                category['itemCount'] as String,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
