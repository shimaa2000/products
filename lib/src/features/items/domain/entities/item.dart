import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  const Item({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });

  Item copyWith({
    int? id,
    String? name,
    String? description,
    String? imageUrl,
    double? price,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        imageUrl,
        price,
      ];
}
