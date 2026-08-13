/// Utility for formatting currency values into Indian Rupee (INR) standard representations.
class CurrencyFormatter {
  // Private constructor to prevent instantiation
  CurrencyFormatter._();

  /// Formats a numeric value into INR format (e.g., ₹1,500 or ₹1,00,000).
  ///
  /// Set [showSymbol] to false to omit the '₹' symbol prefix.
  static String formatINR(double amount, {bool showSymbol = true, int decimalDigits = 0}) {
    final isNegative = amount < 0;
    final absAmount = amount.abs();
    final parts = absAmount.toStringAsFixed(decimalDigits).split('.');

    String integerPart = parts[0];
    final String decimalPart = parts.length > 1 && decimalDigits > 0 ? '.${parts[1]}' : '';

    if (integerPart.length > 3) {
      final lastThree = integerPart.substring(integerPart.length - 3);
      String remaining = integerPart.substring(0, integerPart.length - 3);

      final List<String> chunks = [];
      while (remaining.length > 2) {
        chunks.insert(0, remaining.substring(remaining.length - 2));
        remaining = remaining.substring(0, remaining.length - 2);
      }
      if (remaining.isNotEmpty) {
        chunks.insert(0, remaining);
      }

      integerPart = '${chunks.join(',')},$lastThree';
    }

    final formatted = '$integerPart$decimalPart';
    final sign = isNegative ? '-' : '';
    final symbol = showSymbol ? '₹' : '';

    return '$sign$symbol$formatted';
  }

  /// Formats large currency amounts into compact representations (e.g. ₹1.2K, ₹1.5L, ₹2.5Cr).
  static String formatCompact(double amount, {bool showSymbol = true}) {
    final absAmount = amount.abs();
    final sign = amount < 0 ? '-' : '';
    final symbol = showSymbol ? '₹' : '';

    String valueStr;
    if (absAmount >= 10000000) {
      valueStr = '${(absAmount / 10000000).toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')}Cr';
    } else if (absAmount >= 100000) {
      valueStr = '${(absAmount / 100000).toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')}L';
    } else if (absAmount >= 1000) {
      valueStr = '${(absAmount / 1000).toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')}K';
    } else {
      valueStr = absAmount.toStringAsFixed(0);
    }

    return '$sign$symbol$valueStr';
  }

  // TODO: Add support for custom locale currency parsing or symbol placement
}
