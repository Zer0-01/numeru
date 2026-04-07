import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  final int id;
  final String name;
  final double price;
  final bool isTaxable;
  final List<int> personIds;

  ItemModel({
    required this.id,
    required this.name,
    required this.price,
    this.isTaxable = true,
    required this.personIds,
  });

  ItemModel copyWith({
    int? id,
    String? name,
    double? price,
    bool? isTaxable,
    List<int>? personIds,
  }) {
    return ItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      isTaxable: isTaxable ?? this.isTaxable,
      personIds: personIds ?? this.personIds,
    );
  }

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
