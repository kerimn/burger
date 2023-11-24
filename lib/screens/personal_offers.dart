import 'package:burger/constants/colors.dart';
import 'package:burger/constants/images.dart';
import 'package:burger/screens/shopping_empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PersonalOffers extends StatelessWidget {
  const PersonalOffers({super.key});

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
          "PERSONAL OFFERS",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.grey),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ShoppingCardEmpty(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(bottom: 12),
                  color: mainColor,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 180,
                        child: Image.asset(AppImages.burger),
                      ),
                      Text(
                        "Special offer for \nyou!",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: 12),
                color: const Color(0xFFF90500),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 180,
                      child: Image.asset(AppImages.burger),
                    ),
                    Text(
                      "Special offer for \nyou!",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
