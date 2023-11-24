class CategoryProduct {
  final int id;
  final String name;
  final String img;
  final double price;
  int quantity;
  int totalCount;

  CategoryProduct({
    required this.id,
    required this.name,
    required this.img,
    required this.price,
    this.quantity = 1,
    this.totalCount = 1,
  });
}
