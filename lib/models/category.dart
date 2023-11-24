import 'package:burger/models/category_product.dart';

class CategoryItem {
  final int id;
  final String name;
  final String img;
  final List<CategoryProduct> categoryProduct;

  CategoryItem({
    required this.id,
    required this.name,
    required this.img,
    required this.categoryProduct,
  });
}
