// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonModel _$PersonModelFromJson(Map<String, dynamic> json) => PersonModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  foods:
      (json['foods'] as List<dynamic>)
          .map((e) => PersonFood.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$PersonModelToJson(PersonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'foods': instance.foods,
    };

PersonFood _$PersonFoodFromJson(Map<String, dynamic> json) => PersonFood(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  quantity: (json['quantity'] as num).toInt(),
  price: (json['price'] as num).toDouble(),
);

Map<String, dynamic> _$PersonFoodToJson(PersonFood instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
      'price': instance.price,
    };
