import 'package:json_annotation/json_annotation.dart';

part 'summary_model.g.dart';

@JsonSerializable()
class SummaryModel {
  final int persons;
  final double total;
  final double totalServiceCharge;
  final List<SummaryPerson> summaryPerson;
  final double totalSst;
  final bool isIncludeSst;
  final bool isHaveServiceCharge;

  SummaryModel({
    required this.persons,
    required this.total,
    required this.totalServiceCharge,
    required this.summaryPerson,
    required this.totalSst,
    required this.isIncludeSst,
    required this.isHaveServiceCharge,
  });

  factory SummaryModel.fromJson(Map<String, dynamic> json) =>
      _$SummaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryModelToJson(this);
}

@JsonSerializable()
class SummaryPerson {
  final int id;
  final String name;
  final double totalNeedToPay;
  final double totalServiceCharge;
  final double totalSst;
  final List<SummaryFood> foods;

  SummaryPerson({
    required this.id,
    required this.name,
    required this.totalNeedToPay,
    required this.foods,
    required this.totalServiceCharge,
    required this.totalSst,
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
