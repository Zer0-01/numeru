import 'package:json_annotation/json_annotation.dart';

part 'summary_model.g.dart';

@JsonSerializable()
class SummaryModel {
  final int persons;
  final double total;
  final double serviceCharge;
  final List<SummaryPerson> summary;

  SummaryModel({
    required this.persons,
    required this.total,
    required this.serviceCharge,
    required this.summary,
  });

  factory SummaryModel.fromJson(Map<String, dynamic> json) =>
      _$SummaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryModelToJson(this);
}

@JsonSerializable()
class SummaryPerson {
  final int id;
  final String name;
  final double total;

  SummaryPerson({required this.id, required this.name, required this.total});

  factory SummaryPerson.fromJson(Map<String, dynamic> json) =>
      _$SummaryPersonFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryPersonToJson(this);
}
