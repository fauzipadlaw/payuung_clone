class Wellness {
  final String? title;
  final String? image;
  final double? discount;
  final double? oldPrice;
  final double? price;

  Wellness({
    required this.image,
    required this.title,
    this.discount,
    this.oldPrice,
    required this.price,
  });
}

final List<Wellness> dummy = [
  Wellness(
      title: 'Voucher Indomaret Rp25.000',
      price: 25000,
      image: 'indomaret.png'),
  Wellness(
      title: 'Voucher GrabFood Rp50.000',
      price: 49000,
      image: 'grab.png',
      oldPrice: 50000,
      discount: 3),
  Wellness(title: 'Voucher Gojek Rp25.000', price: 25000, image: 'gojek.png'),
  Wellness(title: 'Voucher H&M p25.000', price: 25000, image: 'hm.png'),
  Wellness(
      title: 'Voucher Alfamart Rp25.000',
      price: 30000,
      discount: 11,
      oldPrice: 32000,
      image: 'alfamart.png'),
  Wellness(title: 'Voucher GrabFood Rp25.000', price: 25000, image: 'grab.png'),
];
