class Wellness {
  final int? id;
  final String? title;
  final String? image;
  final num? discount;
  final num? oldPrice;
  final num? price;

  Wellness({
    this.id,
    required this.image,
    required this.title,
    this.discount,
    this.oldPrice,
    required this.price,
  });
  factory Wellness.fromJson(Map<String, dynamic> json) {
    final well = Wellness(
      id: json['id'] as int?,
      image: json['image'] as String?,
      title: json['title'] as String?,
      discount: json['discount'] as num?,
      oldPrice: json['old_price'] as num?,
      price: json['price'] as num?,
    );
    return well;
  }
}
