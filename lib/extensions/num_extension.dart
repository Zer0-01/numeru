import 'package:numeru/util/currency_formatter.dart';

extension NumCurrencyExtension on num? {
  /// Convenient way to format this number to a Malaysian Ringgit (RM) string.
  /// Example: 1234.56.toRM() -> "RM 1,234.56"
  /// Returns null if the number is null.
  String? toRM() => CurrencyFormatter.formatRM(this);

  /// Convenient way to format this number to a currency value string without the symbol.
  /// Example: 1234.56.formatCurrency() -> "1,234.56"
  /// Returns null if the number is null.
  String? formatCurrency() => CurrencyFormatter.formatValue(this);
}
