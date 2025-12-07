import 'package:json_annotation/json_annotation.dart';

part 'person_model.g.dart';

@JsonSerializable()
class PersonModel {
  final int id;
  final String name;
  final List<PersonFood> foods;

  PersonModel({required this.id, required this.name, required this.foods});

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonModelToJson(this);
}

@JsonSerializable()
class PersonFood {
  final int id;
  final String name;
  final int quantity;
  final double price;

  PersonFood({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
  });

  factory PersonFood.fromJson(Map<String, dynamic> json) =>
      _$PersonFoodFromJson(json);

  Map<String, dynamic> toJson() => _$PersonFoodToJson(this);
}
