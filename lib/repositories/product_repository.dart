import 'package:buynsell/models/product_model.dart';

/// Abstract repository defining the product catalog data contract
/// for the IIT BHU Buy & Sell Marketplace app.
abstract class ProductRepository {
  /// Fetches a list of available products with optional pagination and category filter.
  ///
  /// TODO: Fetch products list from backend or database.
  Future<List<ProductModel>> getProducts({
    int page = 1,
    int limit = 20,
    String? category,
  });

  /// Retrieves a specific product by its unique [id].
  ///
  /// TODO: Fetch detailed product information by ID.
  Future<ProductModel?> getProductById(String id);

  /// Searches products matching the search [query] and optional filters.
  ///
  /// TODO: Query backend or search index for matching products.
  Future<List<ProductModel>> searchProducts(
    String query, {
    String? category,
    double? minPrice,
    double? maxPrice,
  });

  /// Fetches all products under a specific [category].
  ///
  /// TODO: Query backend for products filtered by category.
  Future<List<ProductModel>> getProductsByCategory(String category);

  /// Fetches all products listed by a specific seller using [sellerId].
  ///
  /// TODO: Retrieve products posted by the given seller ID.
  Future<List<ProductModel>> getProductsBySeller(String sellerId);

  /// Creates and lists a new product in the marketplace.
  ///
  /// TODO: Upload product details and images to backend storage.
  Future<ProductModel> createProduct(ProductModel product);

  /// Updates an existing product's information.
  ///
  /// TODO: Persist product updates to backend.
  Future<ProductModel> updateProduct(ProductModel product);

  /// Deletes a product from the marketplace by its [id].
  ///
  /// TODO: Remove product record from database.
  Future<void> deleteProduct(String id);

  /// Toggles whether a product is in the user's wishlist.
  /// Returns `true` if added to wishlist, or `false` if removed.
  ///
  /// TODO: Toggle wishlist status for given product and user.
  Future<bool> toggleWishlist(String productId, String userId);

  /// Retrieves all wishlist products for a given [userId].
  ///
  /// TODO: Fetch user's saved wishlist products from database.
  Future<List<ProductModel>> getWishlist(String userId);
}
