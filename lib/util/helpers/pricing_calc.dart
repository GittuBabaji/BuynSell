/// Pricing calculator for the BuynSell resell marketplace.
///
/// No taxes — payments are handled offline or via provided ID.
/// This utility covers platform fees, discounts, and price formatting.
class PricingCalc {
  PricingCalc._();
  static final PricingCalc instance = PricingCalc._();
  factory PricingCalc() => instance;

  /// Platform service fee percentage (1%).
  static const double platformFeePercent = 1.0;

  // ---------------------------------------------------------------------------
  // Platform fee (1%)
  // ---------------------------------------------------------------------------

  /// Computes the 1% platform fee on the given [price].
  double platformFee(double price) => _round(price * platformFeePercent / 100);

  // ---------------------------------------------------------------------------
  // Discount helpers
  // ---------------------------------------------------------------------------

  /// Returns the discount percentage between [originalPrice] and [sellingPrice].
  ///
  /// Returns `0` if originalPrice is null, zero, or less than sellingPrice.
  double discountPercent({
    required double sellingPrice,
    double? originalPrice,
  }) {
    if (originalPrice == null || originalPrice <= 0) return 0;
    if (sellingPrice >= originalPrice) return 0;
    return _round((originalPrice - sellingPrice) / originalPrice * 100);
  }

  /// Returns the flat discount amount (originalPrice − sellingPrice).
  double discountAmount({
    required double sellingPrice,
    double? originalPrice,
  }) {
    if (originalPrice == null || originalPrice <= sellingPrice) return 0;
    return _round(originalPrice - sellingPrice);
  }

  /// Applies a [percent] discount to [price] and returns the discounted price.
  double applyDiscount(double price, double percent) {
    if (percent <= 0 || percent > 100) return price;
    return _round(price * (1 - percent / 100));
  }

  // ---------------------------------------------------------------------------
  // Full price breakdown
  // ---------------------------------------------------------------------------

  /// Returns a complete [PriceBreakdown] for a product transaction.
  ///
  /// ```dart
  /// final b = PricingCalc.instance.breakdown(
  ///   sellingPrice: 3500,
  ///   originalPrice: 5000,
  /// );
  /// print(b.total);  // 3535.0  (price + 1% fee)
  /// print(b.youSave); // 1500.0
  /// ```
  PriceBreakdown breakdown({
    required double sellingPrice,
    double? originalPrice,
  }) {
    final fee = platformFee(sellingPrice);
    final total = _round(sellingPrice + fee);
    final discount = discountAmount(
      sellingPrice: sellingPrice,
      originalPrice: originalPrice,
    );
    final discPct = discountPercent(
      sellingPrice: sellingPrice,
      originalPrice: originalPrice,
    );

    return PriceBreakdown(
      basePrice: sellingPrice,
      originalPrice: originalPrice,
      discountAmount: discount,
      discountPercent: discPct,
      platformFeePercent: platformFeePercent,
      platformFeeAmount: fee,
      total: total,
    );
  }

  // ---------------------------------------------------------------------------
  // Formatting
  // ---------------------------------------------------------------------------

  /// Formats [amount] as Indian Rupee string — e.g. `₹3,500` or `₹1,50,000`.
  String formatINR(double amount, {int decimals = 0}) {
    final isNegative = amount < 0;
    final fixed = amount.abs().toStringAsFixed(decimals);
    final parts = fixed.split('.');
    final intPart = parts[0];
    final decPart = parts.length > 1 ? '.${parts[1]}' : '';

    String formatted;
    if (intPart.length <= 3) {
      formatted = intPart;
    } else {
      final last3 = intPart.substring(intPart.length - 3);
      final remaining = intPart.substring(0, intPart.length - 3);
      // Indian grouping: groups of 2 after the last 3 digits
      final reversed = remaining.split('').reversed.toList();
      final sb = StringBuffer();
      for (int i = 0; i < reversed.length; i++) {
        if (i > 0 && i % 2 == 0) sb.write(',');
        sb.write(reversed[i]);
      }
      final prefix = sb.toString().split('').reversed.join();
      formatted = '$prefix,$last3';
    }

    return '${isNegative ? '-' : ''}₹$formatted$decPart';
  }

  // ---------------------------------------------------------------------------
  // Internals
  // ---------------------------------------------------------------------------

  double _round(double value) => double.parse(value.toStringAsFixed(2));
}

// =============================================================================
// PriceBreakdown
// =============================================================================

/// Immutable price breakdown for a single product transaction.
class PriceBreakdown {
  final double basePrice;
  final double? originalPrice;
  final double discountAmount;
  final double discountPercent;
  final double platformFeePercent;
  final double platformFeeAmount;
  final double total;

  const PriceBreakdown({
    required this.basePrice,
    this.originalPrice,
    required this.discountAmount,
    required this.discountPercent,
    required this.platformFeePercent,
    required this.platformFeeAmount,
    required this.total,
  });

  /// How much the buyer saves compared to the original price.
  double get youSave => discountAmount;

  /// `true` if there is any discount.
  bool get hasDiscount => discountAmount > 0;

  @override
  String toString() {
    final buf = StringBuffer()
      ..writeln('--- Price Breakdown ---');
    if (originalPrice != null && hasDiscount) {
      buf
        ..writeln('Original Price  : ₹${originalPrice!.toStringAsFixed(2)}')
        ..writeln('Discount        : -₹${discountAmount.toStringAsFixed(2)} ($discountPercent%)');
    }
    buf
      ..writeln('Selling Price   : ₹${basePrice.toStringAsFixed(2)}')
      ..writeln('Platform Fee ($platformFeePercent%) : +₹${platformFeeAmount.toStringAsFixed(2)}')
      ..writeln('-----------------------')
      ..writeln('Total           : ₹${total.toStringAsFixed(2)}');
    if (hasDiscount) {
      buf.writeln('You Save        : ₹${youSave.toStringAsFixed(2)}');
    }
    return buf.toString();
  }
}
