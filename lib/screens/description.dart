import 'package:burger/constants/colors.dart';
import 'package:burger/constants/images.dart';
import 'package:burger/models/category_product.dart';
import 'package:burger/providers/cart_provider.dart';
import 'package:burger/screens/shopping_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({super.key, required this.categoryProduct});
  final CategoryProduct categoryProduct;

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  int count = 0;

  @override
  void didChangeDependencies() {
    var product = context.watch<CartModel>().oneItem(widget.categoryProduct.id);

    if (product.id == widget.categoryProduct.id) {
      count = product.quantity;
      setState(() {});
    }
    super.didChangeDependencies();
  }

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
        iconTheme: const IconThemeData(color: Colors.grey),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.categoryProduct.name.toUpperCase(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "360 grams",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 13),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 100,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            50), // Adjust the value to control the roundness
                        color:
                            const Color(0xFFF90500), // Set the background color
                      ),
                      child: Text(
                        "\$${widget.categoryProduct.price}",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 215,
                      child: Image.asset(
                        widget.categoryProduct.img,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "description".toUpperCase(),
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "sesame seed bun, burger sauce, beef cutlet, pork and beef cutlet, Cheddar cheese, fresh tomatoes, iceberg lettuce.",
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.grey.shade500),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15.0, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (count > 0) {
                        setState(() {
                          count--;
                          print("-");
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade300,
                      ),
                      child: const Icon(
                        Icons.remove,
                        color: Colors.black,
                        size: 20.0,
                      ),
                    ),
                  ),
                  Text("$count", style: Theme.of(context).textTheme.bodyLarge),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        count++;
                        print("$count");
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade300,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ShoppingCard()));
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 40.0),
                ),
              ),
              child: Text(
                'Add to Order'.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
