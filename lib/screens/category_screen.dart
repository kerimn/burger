import 'package:burger/constants/colors.dart';
import 'package:burger/constants/images.dart';
import 'package:burger/data/category.dart';
import 'package:burger/models/category.dart';
import 'package:burger/screens/category_products.dart';
import 'package:burger/screens/qr_screen.dart';
import 'package:burger/widgets/custom_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart' as badges;

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: const CustomAppBar(),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
        itemBuilder: (context, index) {
          CategoryItem categoryItem = categories.elementAt(index);
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryProducts(
                    categoryTitle: categoryItem.name,
                    categoryItems: categoryItem.categoryProduct,
                  ),
                ),
              );
            },
            child: ProductsCard(categoryItem: categoryItem),
          );
        },
        itemCount: categories.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          height: 180,
        ),
      ),
    );
  }
}

class ProductsCard extends StatelessWidget {
  const ProductsCard({
    super.key,
    required this.categoryItem,
  });

  final CategoryItem categoryItem;

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
            categoryItem.img,
            width: 160,
            height: 105,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            categoryItem.name,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Stack(
            children: [
              Text(
                "olymp".toUpperCase(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Positioned(
                top: 2.5,
                right: 15.5,
                child: SvgPicture.asset(
                  AppImages.greenpolygon,
                  height: 8,
                  width: 8,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 5,
          ),
          Stack(
            children: [
              Text(
                "Club".toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Positioned(
                bottom: 3,
                left: 2,
                child: SvgPicture.asset(
                  AppImages.redPolygon,
                  height: 8,
                  width: 8,
                ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QrPage(),
                ),
              );
            },
            child: SvgPicture.asset(
              AppImages.qrIcon,
              height: 24,
              width: 24,
            ),
          )
        ],
      ),
    );
  }
}
