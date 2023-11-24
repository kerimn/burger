import 'package:burger/constants/colors.dart';
import 'package:burger/constants/images.dart';
import 'package:burger/screens/personal_offers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QrPage extends StatelessWidget {
  const QrPage({super.key});

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
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppImages.maximze,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppImages.reload,
              color: Colors.grey,
            ),
          )
        ],
        title: Text(
          "QR-CODE",
          style: Theme.of(context).textTheme.titleLarge!,
        ),
        iconTheme: const IconThemeData(color: Colors.grey),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset(
                  AppImages.qr,
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 4),
                Text(
                  "Your bonus",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.grey, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 8),
                Text(
                  "150",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 28,
                        color: const Color(0xFFF90500),
                      ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 30)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(mainColor),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 50.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const PersonalOffers(),
                      ),
                    );
                  },
                  child: Text(
                    "My personal offers".toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
