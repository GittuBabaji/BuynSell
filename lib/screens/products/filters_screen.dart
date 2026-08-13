import 'package:flutter/material.dart';

/// Filter selection data model returned by [FiltersScreen].
class FilterOptions {
  final RangeValues priceRange;
  final String? category;
  final List<String> conditions;
  final String sortBy;

  FilterOptions({
    required this.priceRange,
    this.category,
    required this.conditions,
    required this.sortBy,
  });
}

/// Screen providing user controls for filtering product listings.
class FiltersScreen extends StatefulWidget {
  final FilterOptions? initialFilters;

  const FiltersScreen({
    super.key,
    this.initialFilters,
  });

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  late RangeValues _priceRange;
  String? _selectedCategory;
  late List<String> _selectedConditions;
  late String _sortBy;

  final List<String> _categories = [
    'All Categories',
    'Books & Academics',
    'Electronics',
    'Bicycles',
    'Hostel Essentials',
    'Clothing & Accessories',
    'Sports & Fitness',
    'Other',
  ];

  final List<String> _conditionOptions = [
    'Brand New',
    'Like New',
    'Used - Good',
    'Used - Fair',
  ];

  final List<String> _sortOptions = [
    'Newest First',
    'Price: Low to High',
    'Price: High to Low',
    'Popularity',
  ];

  @override
  void initState() {
    super.initState();
    _priceRange = widget.initialFilters?.priceRange ?? const RangeValues(0, 10000);
    _selectedCategory = widget.initialFilters?.category ?? _categories[0];
    _selectedConditions = widget.initialFilters?.conditions ?? [];
    _sortBy = widget.initialFilters?.sortBy ?? _sortOptions[0];
  }

  void _resetFilters() {
    setState(() {
      _priceRange = const RangeValues(0, 10000);
      _selectedCategory = _categories[0];
      _selectedConditions.clear();
      _sortBy = _sortOptions[0];
    });
  }

  void _applyFilters() {
    final filters = FilterOptions(
      priceRange: _priceRange,
      category: _selectedCategory == 'All Categories' ? null : _selectedCategory,
      conditions: _selectedConditions,
      sortBy: _sortBy,
    );
    // TODO: Process or return filter selections
    Navigator.pop(context, filters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Products'),
        actions: [
          TextButton(
            onPressed: _resetFilters,
            child: const Text('Reset'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Dropdown
            const Text(
              'Category',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: _selectedCategory,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              items: _categories.map((category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
            ),

            const SizedBox(height: 24),

            // Price Range Slider
            Text(
              'Price Range (₹${_priceRange.start.round()} - ₹${_priceRange.end.round()})',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            RangeSlider(
              values: _priceRange,
              min: 0,
              max: 20000,
              divisions: 40,
              labels: RangeLabels(
                '₹${_priceRange.start.round()}',
                '₹${_priceRange.end.round()}',
              ),
              onChanged: (values) {
                setState(() {
                  _priceRange = values;
                });
              },
            ),

            const SizedBox(height: 24),

            // Condition Checkboxes
            const Text(
              'Item Condition',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ..._conditionOptions.map((condition) {
              final isSelected = _selectedConditions.contains(condition);
              return CheckboxListTile(
                title: Text(condition),
                value: isSelected,
                contentPadding: EdgeInsets.zero,
                dense: true,
                onChanged: (checked) {
                  setState(() {
                    if (checked == true) {
                      _selectedConditions.add(condition);
                    } else {
                      _selectedConditions.remove(condition);
                    }
                  });
                },
              );
            }),

            const SizedBox(height: 24),

            // Sort Options
            const Text(
              'Sort By',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ..._sortOptions.map((option) {
              return RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: _sortBy,
                contentPadding: EdgeInsets.zero,
                dense: true,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _sortBy = value;
                    });
                  }
                },
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: _applyFilters,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            child: const Text('Apply Filters', style: TextStyle(fontSize: 16)),
          ),
        ),
      ),
    );
  }
}
