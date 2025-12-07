// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SummaryModel _$SummaryModelFromJson(Map<String, dynamic> json) => SummaryModel(
  persons: (json['persons'] as num).toInt(),
  total: (json['total'] as num).toDouble(),
  serviceCharge: (json['serviceCharge'] as num).toDouble(),
  summary:
      (json['summary'] as List<dynamic>)
          .map((e) => SummaryPerson.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$SummaryModelToJson(SummaryModel instance) =>
    <String, dynamic>{
      'persons': instance.persons,
      'total': instance.total,
      'serviceCharge': instance.serviceCharge,
      'summary': instance.summary,
    };

SummaryPerson _$SummaryPersonFromJson(Map<String, dynamic> json) =>
    SummaryPerson(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      total: (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$SummaryPersonToJson(SummaryPerson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'total': instance.total,
    };
