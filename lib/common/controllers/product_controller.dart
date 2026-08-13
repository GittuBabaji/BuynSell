import 'package:flutter/foundation.dart';

class ProductController extends ChangeNotifier {
  List<Map<String, dynamic>> products = [];
  bool isLoading = false;
  String? selectedCategory;

  Future<void> fetchProducts() async {
    // TODO: Implement fetching products list from API
  }

  Future<void> searchProducts(String query) async {
    // TODO: Implement product search logic
  }

  Future<void> filterProducts(String category) async {
    // TODO: Implement category filtering
  }

  Future<void> refreshProducts() async {
    // TODO: Implement refreshing products list
  }
}
