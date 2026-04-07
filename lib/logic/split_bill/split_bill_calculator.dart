import 'package:numeru/data/models/item_model.dart';
import 'package:numeru/data/models/person_model.dart';
import 'package:numeru/data/models/split_summary_model.dart';

class SplitBillCalculator {
  /// Situation 1: Standard Café / Restaurant (Service Charge + SST)
  /// Formula:
  /// 1. Subtotal = Sum of all item prices
  /// 2. Service Charge (SC) = Subtotal * serviceChargeRatePercentage / 100
  /// 3. Taxable Amount = (Sum of Taxable Items) + SC
  /// 4. SST = Taxable Amount * taxRatePercentage / 100
  /// 5. Total = Subtotal + SC + SST
  static SplitSummaryModel calculateSituation1({
    required List<ItemModel> items,
    required List<PersonModel> people,
    required double taxRatePercentage,
    required double serviceChargeRatePercentage,
  }) {
    // 1. Calculate Subtotal and Taxable Base from Items
    double subtotal = 0;
    double taxableItemsSubtotal = 0;

    for (var item in items) {
      subtotal += item.price;
      if (item.isTaxable) {
        taxableItemsSubtotal += item.price;
      }
    }

    // 2. Calculate Service Charge
    final double serviceChargeAmount = subtotal * (serviceChargeRatePercentage / 100);

    // 3. Calculate SST
    // SST is applied to taxable items + service charge
    final double taxableBase = taxableItemsSubtotal + serviceChargeAmount;
    final double taxAmount = taxableBase * (taxRatePercentage / 100);

    // 4. Final Total
    final double finalTotalRaw = subtotal + serviceChargeAmount + taxAmount;
    final double finalTotal = _round(finalTotalRaw);
    final double roundingAmount = finalTotal - finalTotalRaw;

    // 5. Calculate Equal Share per person
    final double perPersonTotalRaw = finalTotal / people.length;
    final List<String> allItemNames =
        items.map((e) => e.name.isEmpty ? "Unnamed Item" : e.name).toList();

    double runningSplitTotal = 0;
    final List<PersonSummaryModel> personSummaries = [];

    for (int i = 0; i < people.length; i++) {
      final person = people[i];
      double personTotal = 0;

      // Rounding adjustment on the last person
      if (i == people.length - 1) {
        personTotal = _round(finalTotal - runningSplitTotal);
      } else {
        personTotal = _round(perPersonTotalRaw);
        runningSplitTotal += personTotal;
      }

      personSummaries.add(
        PersonSummaryModel(
          id: person.id,
          name: person.name,
          totalAmount: personTotal,
          itemNames: allItemNames,
        ),
      );
    }

    return SplitSummaryModel(
      subtotal: subtotal,
      taxAmount: taxAmount,
      taxPercentage: taxRatePercentage,
      serviceChargeAmount: serviceChargeAmount,
      totalAmount: finalTotal,
      roundingAmount: roundingAmount,
      personSummaries: personSummaries,
    );
  }

  static double _round(double value) {
    return (value * 100).roundToDouble() / 100;
  }
}
