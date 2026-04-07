import 'package:equatable/equatable.dart';

class EqualSplitSummaryModel extends Equatable {
  final double subtotal;
  final double taxAmount;
  final double taxPercentage;
  final double serviceChargeAmount;
  final double totalAmount;
  final double roundingAmount;
  final int numberOfPeople;
  final double amountPerPerson;

  const EqualSplitSummaryModel({
    required this.subtotal,
    required this.taxAmount,
    required this.taxPercentage,
    required this.serviceChargeAmount,
    required this.totalAmount,
    required this.roundingAmount,
    required this.numberOfPeople,
    required this.amountPerPerson,
  });

  @override
  List<Object?> get props => [
        subtotal,
        taxAmount,
        taxPercentage,
        serviceChargeAmount,
        totalAmount,
        roundingAmount,
        numberOfPeople,
        amountPerPerson,
      ];
}
