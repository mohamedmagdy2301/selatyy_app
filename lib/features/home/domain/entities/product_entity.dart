class ProductEntity {
  final int? id;
  final String? name;
  final String? details;
  final String? price;
  final String? image;
  final int? isFavorite;

  ProductEntity({
    required this.id,
    required this.name,
    required this.details,
    required this.price,
    required this.image,
    required this.isFavorite,
  });
}
