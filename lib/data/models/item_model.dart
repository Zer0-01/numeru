import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  final int id;
  final String name;
  final double price;
  final List<int> personIds;

  ItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.personIds,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
