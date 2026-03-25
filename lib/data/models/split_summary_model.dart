import 'package:equatable/equatable.dart';

class PersonSummaryModel extends Equatable {
  final int id;
  final String name;
  final double totalAmount;
  final List<String> itemNames;

  const PersonSummaryModel({
    required this.id,
    required this.name,
    required this.totalAmount,
    required this.itemNames,
  });

  @override
  List<Object?> get props => [id, name, totalAmount, itemNames];
}

class SplitSummaryModel extends Equatable {
  final double subtotal;
  final double taxAmount;
  final double taxPercentage;
  final double serviceChargeAmount;
  final double includedTaxAmount;
  final double totalAmount;
  final double roundingAmount;
  final String taxMode;
  final List<PersonSummaryModel> personSummaries;

  const SplitSummaryModel({
    required this.subtotal,
    required this.taxAmount,
    required this.taxPercentage,
    required this.serviceChargeAmount,
    required this.includedTaxAmount,
    required this.totalAmount,
    required this.roundingAmount,
    required this.taxMode,
    required this.personSummaries,
  });

  @override
  List<Object?> get props => [
    subtotal,
    taxAmount,
    taxPercentage,
    serviceChargeAmount,
    includedTaxAmount,
    totalAmount,
    roundingAmount,
    taxMode,
    personSummaries,
  ];
}
