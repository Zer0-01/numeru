// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SummaryModel _$SummaryModelFromJson(Map<String, dynamic> json) => SummaryModel(
  persons: (json['persons'] as num).toInt(),
  totalBillInput: (json['totalBillInput'] as num).toDouble(),
  totalServiceChargeInput: (json['totalServiceChargeInput'] as num).toDouble(),
  summaryPerson:
      (json['summaryPerson'] as List<dynamic>)
          .map((e) => SummaryPerson.fromJson(e as Map<String, dynamic>))
          .toList(),
  totalSst: (json['totalSst'] as num).toDouble(),
  isIncludeSst: json['isIncludeSst'] as bool,
  isHaveServiceCharge: json['isHaveServiceCharge'] as bool,
  totalBillCalculate: (json['totalBillCalculate'] as num).toDouble(),
  totalServiceChargeCalculate:
      (json['totalServiceChargeCalculate'] as num).toDouble(),
  totalBillDifference: (json['totalBillDifference'] as num).toDouble(),
  totalServiceChargeDifference:
      (json['totalServiceChargeDifference'] as num).toDouble(),
  totalSubtotal: (json['totalSubtotal'] as num).toDouble(),
);

Map<String, dynamic> _$SummaryModelToJson(SummaryModel instance) =>
    <String, dynamic>{
      'persons': instance.persons,
      'totalBillInput': instance.totalBillInput,
      'totalServiceChargeInput': instance.totalServiceChargeInput,
      'summaryPerson': instance.summaryPerson,
      'totalSst': instance.totalSst,
      'isIncludeSst': instance.isIncludeSst,
      'isHaveServiceCharge': instance.isHaveServiceCharge,
      'totalBillCalculate': instance.totalBillCalculate,
      'totalServiceChargeCalculate': instance.totalServiceChargeCalculate,
      'totalBillDifference': instance.totalBillDifference,
      'totalServiceChargeDifference': instance.totalServiceChargeDifference,
      'totalSubtotal': instance.totalSubtotal,
    };

SummaryPerson _$SummaryPersonFromJson(Map<String, dynamic> json) =>
    SummaryPerson(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      needToPay: (json['totalNeedToPay'] as num).toDouble(),
      foods:
          (json['foods'] as List<dynamic>)
              .map((e) => SummaryFood.fromJson(e as Map<String, dynamic>))
              .toList(),
      serviceCharge: (json['totalServiceCharge'] as num).toDouble(),
      sst: (json['totalSst'] as num).toDouble(),
      subtotal: (json['totalSubtotal'] as num).toDouble(),
    );

Map<String, dynamic> _$SummaryPersonToJson(SummaryPerson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'totalNeedToPay': instance.needToPay,
      'totalServiceCharge': instance.serviceCharge,
      'totalSst': instance.sst,
      'foods': instance.foods,
      'totalSubtotal': instance.subtotal,
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
