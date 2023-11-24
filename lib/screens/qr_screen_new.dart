import 'package:burger/constants/colors.dart';
import 'package:burger/constants/images.dart';
import 'package:burger/screens/personal_offers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewQrPage extends StatelessWidget {
  const NewQrPage({super.key});

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
          "QR-CODE",
          style: Theme.of(context).textTheme.titleLarge!,
        ),
        iconTheme: const IconThemeData(color: Colors.grey),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  AppImages.qr,
                  width: 200,
                  height: 200,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
