import 'package:burger/constants/colors.dart';
import 'package:burger/constants/images.dart';
import 'package:burger/models/category_product.dart';
import 'package:burger/providers/cart_provider.dart';
import 'package:burger/screens/qr_screen.dart';
import 'package:burger/screens/shopping_empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ShoppingCard extends StatelessWidget {
  const ShoppingCard({super.key});

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();
    return Scaffold(
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
        title: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("My order", style: Theme.of(context).textTheme.titleLarge),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const QrPage(),
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
        ),
      ),
      body: Container(
        color: bgColor,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            cart.items.isEmpty
                ? Expanded(
                    child: Container(
                        width: double.infinity,
                        color: bgColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(AppImages.emptyImg),
                            const SizedBox(height: 20),
                            Text(
                              "Your cart is empty",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: Colors.grey),
                            )
                          ],
                        )),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: cart.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        CategoryProduct categoryProduct =
                            cart.items.elementAt(index);

                        return Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        child: Text(
                                          categoryProduct.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        "\$${categoryProduct.price}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 120,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            cart.remove(categoryProduct);
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
                                        Text(
                                          categoryProduct.quantity.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(fontSize: 16),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            cart.add(categoryProduct);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(8.0),
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: mainColor,
                                            ),
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 70,
                                height: 50,
                                child: Image.asset(
                                  categoryProduct.img,
                                  fit: BoxFit.cover,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
            cart.items.isEmpty ? const SizedBox() : InfoCard(cart: cart),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.cart,
  });

  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainColor,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 13.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Subtotal",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.normal),
                ),
                Text(
                  "\$${cart.totalPrice.toStringAsFixed(2)}",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 13.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.normal),
                ),
                Text(
                  "\$4.13",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 10,
            child: CustomPaint(
              painter: DashedLinePainter(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 13.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total amount",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.normal),
                ),
                Text(
                  "\$${(cart.totalPrice + 4.13).toStringAsFixed(2)}",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 13),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShoppingCardEmpty(),
                ),
              );
            },
            style: ButtonStyle(
              minimumSize:
                  MaterialStateProperty.all(const Size(double.infinity, 50)),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 50.0),
              ),
            ),
            child: Text(
              'order now'.toUpperCase(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 5, dashSpace = 10, startX = 0;
    final paint = Paint()
      ..color = const Color.fromRGBO(255, 255, 255, 0.5)
      ..strokeWidth = 1;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
