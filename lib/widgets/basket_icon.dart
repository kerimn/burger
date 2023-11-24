import 'package:burger/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BasketIconWithBadge extends StatelessWidget {
  final int itemCount;

  const BasketIconWithBadge({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Basket Icon
        SvgPicture.asset(AppImages.shoppingCard),
        // Badge with Item Count
        Positioned(
          top: -4,
          right: 3,
          child: Container(
            width: 20,
            height: 20,
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20.0),
            ),
            constraints: const BoxConstraints(
              minWidth: 20,
              minHeight: 20.0,
            ),
            child: Center(
              child: Text(
                itemCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
