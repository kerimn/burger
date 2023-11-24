import 'package:burger/constants/images.dart';
import 'package:burger/constants/themes.dart';
import 'package:burger/providers/cart_provider.dart';
import 'package:burger/screens/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Burger',
      theme: myTheme,
      home: const InitalPage(),
    );
  }
}

class InitalPage extends StatelessWidget {
  const InitalPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingPage()),
      );
    });
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: const Text(
                "OLYMP",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                ),
              ),
            ),
            Positioned(
              top: 1,
              right: 20,
              child: SvgPicture.asset(
                AppImages.greenpolygon,
                width: 12,
                height: 12,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                "CLUB",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                ),
              ),
            ),
            Positioned(
              bottom: 11,
              left: 13,
              child: SvgPicture.asset(
                AppImages.redPolygon,
                width: 13,
                height: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
