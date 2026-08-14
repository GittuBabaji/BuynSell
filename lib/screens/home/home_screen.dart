import 'package:flutter/material.dart';

/// Main Home Screen for the Buy N Sell IIT BHU app.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // TODO: Replace sample static categories with backend/provider data loading logic
  final List<Map<String, dynamic>> _featuredCategories = const [
    {'name': 'Books', 'icon': Icons.menu_book},
    {'name': 'Electronics', 'icon': Icons.devices},
    {'name': 'Bicycles', 'icon': Icons.directions_bike},
    {'name': 'Mattresses', 'icon': Icons.bed},
  ];

  // TODO: Replace sample static listings with backend/provider data loading logic
  final List<Map<String, String>> _recentListings = const [
    {
      'title': 'Hero Cycle 21-Speed',
      'price': '₹ 3,500',
      'hostel': 'Limbdi Hostel',
    },
    {
      'title': 'Engineering Physics Books',
      'price': '₹ 800',
      'hostel': 'Rajputana Hostel',
    },
    {
      'title': 'Single Bed Mattress',
      'price': '₹ 1,200',
      'hostel': 'DG Hostel',
    },
    {
      'title': 'Study Table Lamp',
      'price': '₹ 400',
      'hostel': 'Morvi Hostel',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy N Sell IIT BHU'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Implement notifications screen navigation
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search products in IIT BHU...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).cardColor,
                ),
                onSubmitted: (query) {
                  // TODO: Implement search filter functionality
                },
              ),
              const SizedBox(height: 24.0),

              // Featured Categories Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Featured Categories',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Navigate to CategoriesScreen
                      Navigator.pushNamed(context, '/categories');
                    },
                    child: const Text('View All'),
                  ),
                ],
              ),
              const SizedBox(height: 12.0),

              // Featured Categories Grid
              // TODO: Wire up actual category data loading from API/Repository
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _featuredCategories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.85,
                ),
                itemBuilder: (context, index) {
                  final category = _featuredCategories[index];
                  return InkWell(
                    onTap: () {
                      // TODO: Filter listings by category
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 26,
                          backgroundColor: Theme.of(context)
                              .primaryColor
                              .withValues(alpha: 0.1),
                          child: Icon(
                            category['icon'] as IconData,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          category['name'] as String,
                          style: const TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 24.0),

              // Recent Listings Header
              Text(
                'Recent Listings',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 12.0),

              // Recent Listings Cards
              // TODO: Fetch recent product listings dynamically from database/API
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _recentListings.length,
                itemBuilder: (context, index) {
                  final item = _recentListings[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12.0),
                    child: ListTile(
                      leading: Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.image, color: Colors.grey),
                      ),
                      title: Text(
                        item['title']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(item['hostel']!),
                      trailing: Text(
                        item['price']!,
                        style: TextStyle(
                          color: Theme.of(context).primaryColorLight,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      onTap: () {
                        // TODO: Navigate to Product Detail Screen
                      },
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
