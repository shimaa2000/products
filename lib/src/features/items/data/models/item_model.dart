import '../../domain/entities/item.dart';

class ItemModel extends Item {
  ItemModel({
    required super.id,
    required super.name,
    required super.description,
    required super.imageUrl,
   required super.price,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      name: json['title'] ?? 'N/A',
      description: json['description'] ?? 'N/A',
      imageUrl: json['image'] ?? '',
      price: json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
    };
  }
}
