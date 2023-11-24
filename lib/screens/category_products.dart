import 'package:burger/constants/colors.dart';
import 'package:burger/constants/images.dart';
import 'package:burger/models/category_product.dart';
import 'package:burger/screens/description.dart';
import 'package:burger/widgets/custom_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class CategoryProducts extends StatefulWidget {
  const CategoryProducts(
      {super.key, required this.categoryItems, required this.categoryTitle});
  final List<CategoryProduct> categoryItems;
  final String categoryTitle;

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leadingWidth: 40,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: const EdgeInsets.only(left: 10),
            child: SvgPicture.asset(
              AppImages.chevron,
              color: Colors.grey,
            ),
          ),
        ),
        backgroundColor: bgColor,
        elevation: 0,
        title: Text(
          widget.categoryTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        iconTheme: const IconThemeData(color: Colors.grey),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                prefixIcon: Container(
                  padding: const EdgeInsets.all(8),
                  child: Transform.scale(
                    scale: 0.7,
                    child: SvgPicture.asset(
                      AppImages.searchIcon,
                    ),
                  ),
                ),
                hintText: "Search",
                hintStyle: const TextStyle(fontFamily: "Poppins"),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade100),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: mainColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
              itemBuilder: (context, index) {
                CategoryProduct categoryProducts =
                    widget.categoryItems.elementAt(index);

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DescriptionScreen(
                          categoryProduct: categoryProducts,
                        ),
                      ),
                    );
                  },
                  child: ProductCard(categoryProducts: categoryProducts),
                );
              },
              itemCount: widget.categoryItems.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                crossAxisCount: 2,
                crossAxisSpacing: 25.0,
                mainAxisSpacing: 25.0,
                height: 220,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.categoryProducts,
  });

  final CategoryProduct categoryProducts;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 0.5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      padding: const EdgeInsets.only(top: 13, left: 12, right: 12),
      child: Column(
        children: [
          Image.asset(
            categoryProducts.img,
            width: 160,
            height: 105,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            categoryProducts.name,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Container(
              padding: const EdgeInsets.only(top: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$${categoryProducts.price}",
                      style: Theme.of(context).textTheme.titleSmall),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                    ),
                    onPressed: () {
                      var cart = context.read<CartModel>();
                      cart.add(categoryProducts);
                    },
                    child: SizedBox(
                      width: 45,
                      height: 20,
                      child: SvgPicture.asset(
                        AppImages.shoppingCard,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
