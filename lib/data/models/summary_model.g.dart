// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SummaryModel _$SummaryModelFromJson(Map<String, dynamic> json) => SummaryModel(
  persons: (json['persons'] as num).toInt(),
  total: (json['total'] as num).toDouble(),
  totalServiceCharge: (json['totalServiceCharge'] as num).toDouble(),
  summaryPerson:
      (json['summaryPerson'] as List<dynamic>)
          .map((e) => SummaryPerson.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalSst: (json['totalSst'] as num).toDouble(),
  isIncludeSst: json['isIncludeSst'] as bool,
  isHaveServiceCharge: json['isHaveServiceCharge'] as bool,
);

Map<String, dynamic> _$SummaryModelToJson(SummaryModel instance) =>
    <String, dynamic>{
      'persons': instance.persons,
      'total': instance.total,
      'totalServiceCharge': instance.totalServiceCharge,
      'summaryPerson': instance.summaryPerson,
      'totalSst': instance.totalSst,
      'isIncludeSst': instance.isIncludeSst,
      'isHaveServiceCharge': instance.isHaveServiceCharge,
    };

SummaryPerson _$SummaryPersonFromJson(Map<String, dynamic> json) =>
    SummaryPerson(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      totalNeedToPay: (json['totalNeedToPay'] as num).toDouble(),
      foods:
          (json['foods'] as List<dynamic>)
              .map((e) => SummaryFood.fromJson(e as Map<String, dynamic>))
              .toList(),
      totalServiceCharge: (json['totalServiceCharge'] as num).toDouble(),
      totalSst: (json['totalSst'] as num).toDouble(),
    );

Map<String, dynamic> _$SummaryPersonToJson(SummaryPerson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'totalNeedToPay': instance.totalNeedToPay,
      'totalServiceCharge': instance.totalServiceCharge,
      'totalSst': instance.totalSst,
      'foods': instance.foods,
    };

SummaryFood _$SummaryFoodFromJson(Map<String, dynamic> json) => SummaryFood(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  quantity: (json['quantity'] as num).toInt(),
  basePrice: (json['basePrice'] as num).toDouble(),
  sst: (json['sst'] as num).toDouble(),
  priceWithSst: (json['priceWithSst'] as num).toDouble(),
);

Map<String, dynamic> _$SummaryFoodToJson(SummaryFood instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
      'basePrice': instance.basePrice,
      'sst': instance.sst,
      'priceWithSst': instance.priceWithSst,
    };
