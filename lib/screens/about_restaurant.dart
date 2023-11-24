import 'package:burger/constants/colors.dart';
import 'package:burger/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
          "ABOUT OUR RESTAURANT",
          style: Theme.of(context).textTheme.titleLarge!,
        ),
        iconTheme: const IconThemeData(color: Colors.grey),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppImages.olymp),
              const SizedBox(height: 30),
              Text(
                "🌟 Olymp Club Delivery: Elevate Your Culinary Experience! 🌟"
                    .toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 24),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Craving a taste of excellence delivered straight to your doorstep? Look no further than Olymp Club Delivery! We're not just a delivery service; we're your ticket to a world of culinary delights without leaving the comfort of your home.",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 13),
              ),
              const SizedBox(height: 5),
              Text("✨ Why Olymp Club Delivery?",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 13)),
              const SizedBox(height: 5),
              Text(
                "🚀 Swift and Reliable: Our fleet of delivery champions ensures your order arrives promptly, hot, and ready to tantalize your taste buds.",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 13),
              ),
              const SizedBox(height: 5),
              Text(
                  "🌎 Global Flavors, Local Comfort: Explore a diverse menu featuring international cuisines and local favorites, expertly curatedevery palate",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 13)),
              Text(
                "‍🍳 Chef-Crafted Creations: Indulge in dishes crafted by culinary maestros, prepared with the finest ingredients and a dash of passion.",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 13),
              ),
              const SizedBox(height: 5),
              Text(
                  "🛡️ Contactless Convenience: Your safety is our priority. Enjoy contactless delivery, allowing you to savor your meal worry-free.",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 13)),
              const SizedBox(height: 10),
              Text(
                "Olymp Club Delivery - Where Culinary Excellence Meets Your Convenience. 🌟 Your feast awaits!",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
