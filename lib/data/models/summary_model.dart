import 'package:json_annotation/json_annotation.dart';

part 'summary_model.g.dart';

@JsonSerializable()
class SummaryModel {
  final int persons;
  final double totalBillInput;
  final double totalServiceChargeInput;
  final List<SummaryPerson> summaryPerson;
  final double totalSst;
  final bool isIncludeSst;
  final bool isHaveServiceCharge;
  final double totalBillCalculate;
  final double totalServiceChargeCalculate;
  final double totalBillDifference;
  final double totalServiceChargeDifference;
  final double totalSubtotal;

  SummaryModel({
    required this.persons,
    required this.totalBillInput,
    required this.totalServiceChargeInput,
    required this.summaryPerson,
    required this.totalSst,
    required this.isIncludeSst,
    required this.isHaveServiceCharge,
    required this.totalBillCalculate,
    required this.totalServiceChargeCalculate,
    required this.totalBillDifference,
    required this.totalServiceChargeDifference,
    required this.totalSubtotal,
  });

  factory SummaryModel.fromJson(Map<String, dynamic> json) =>
      _$SummaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryModelToJson(this);
}

@JsonSerializable()
class SummaryPerson {
  final int id;
  final String name;
  final double needToPay;
  final double serviceCharge;
  final double sst;
  final List<SummaryFood> foods;
  final double subtotal;

  SummaryPerson({
    required this.id,
    required this.name,
    required this.needToPay,
    required this.foods,
    required this.serviceCharge,
    required this.sst,
    required this.subtotal,
  });

  factory SummaryPerson.fromJson(Map<String, dynamic> json) =>
      _$SummaryPersonFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryPersonToJson(this);
}

@JsonSerializable()
class SummaryFood {
  final int id;
  final String name;
  final int quantity;
  final double basePrice;
  final double sst;
  final double priceWithSst;

  SummaryFood({
    required this.id,
    required this.name,
    required this.quantity,
    required this.basePrice,
    required this.sst,
    required this.priceWithSst,
  });

  factory SummaryFood.fromJson(Map<String, dynamic> json) =>
      _$SummaryFoodFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryFoodToJson(this);
}
