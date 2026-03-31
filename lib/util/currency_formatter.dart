import 'package:intl/intl.dart';

class CurrencyFormatter {
  /// Formats a number as a Malaysian Ringgit (RM) string.
  /// Example: 1234.56 -> "RM 1,234.56"
  /// Returns null if [value] is null.
  static String? formatRM(num? value) {
    if (value == null) return null;
    
    final formatter = NumberFormat.currency(
      symbol: 'RM ',
      decimalDigits: 2,
    );
    return formatter.format(value);
  }

  /// Formats a number to a currency value string without the RM symbol.
  /// Example: 1234.56 -> "1,234.56"
  /// Returns null if [value] is null.
  static String? formatValue(num? value) {
    if (value == null) return null;
    
    final formatter = NumberFormat.decimalPattern()
      ..minimumFractionDigits = 2
      ..maximumFractionDigits = 2;
    return formatter.format(value);
  }
}
