import 'package:burger/constants/colors.dart';
import 'package:burger/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShoppingCardEmpty extends StatelessWidget {
  const ShoppingCardEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
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
        title: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "My order",
                style: Theme.of(context).textTheme.titleLarge!,
              ),
              GestureDetector(
                onTap: () {},
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
                  .titleMedium!
                  .copyWith(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
