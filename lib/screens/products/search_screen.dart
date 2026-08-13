import 'package:flutter/material.dart';

/// Screen allowing users to search products with search query history and results list.
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _recentSearches = [
    'Cycle',
    'Calculators',
    'Lab Coat',
    'Mattress',
    'Cooler',
  ];
  
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    // TODO: Implement search debouncing with Timer/RxDart
    setState(() {
      _isSearching = _searchController.text.isNotEmpty;
    });
  }

  void _onSearchSubmitted(String query) {
    if (query.trim().isEmpty) return;
    setState(() {
      if (!_recentSearches.contains(query)) {
        _recentSearches.insert(0, query);
      }
      _isSearching = true;
    });
    // TODO: Trigger actual search query towards backend/state management
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search books, cycles, electronics...',
            border: InputBorder.none,
            suffixIcon: _searchController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                    },
                  )
                : null,
          ),
          onSubmitted: _onSearchSubmitted,
        ),
      ),
      body: _isSearching ? _buildSearchResults() : _buildRecentSearches(),
    );
  }

  Widget _buildRecentSearches() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent Searches',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              if (_recentSearches.isNotEmpty)
                TextButton(
                  onPressed: () {
                    setState(() {
                      _recentSearches.clear();
                    });
                  },
                  child: const Text('Clear All'),
                ),
            ],
          ),
        ),
        Expanded(
          child: _recentSearches.isEmpty
              ? const Center(
                  child: Text(
                    'No recent searches',
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  itemCount: _recentSearches.length,
                  itemBuilder: (context, index) {
                    final searchItem = _recentSearches[index];
                    return ListTile(
                      leading: const Icon(Icons.history),
                      title: Text(searchItem),
                      trailing: IconButton(
                        icon: const Icon(Icons.close, size: 18),
                        onPressed: () {
                          setState(() {
                            _recentSearches.removeAt(index);
                          });
                        },
                      ),
                      onTap: () {
                        _searchController.text = searchItem;
                        _onSearchSubmitted(searchItem);
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildSearchResults() {
    // TODO: Map actual search results from state / API
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            width: 48,
            height: 48,
            color: Colors.grey[200],
            child: const Icon(Icons.image, color: Colors.grey),
          ),
          title: Text('Result Item ${index + 1} matching "${_searchController.text}"'),
          subtitle: const Text('₹599 • IIT BHU Campus'),
          onTap: () {
            // TODO: Navigate to ProductDetailsScreen
          },
        );
      },
    );
  }
}
